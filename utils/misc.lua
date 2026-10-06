function swp_uti.find(table, value)
    for i, v in ipairs(table) do
        if v == value then
            return i
        end
    end
    return nil
end

--- Balances chips and shows the cosmetic effects just like Plasma deck
---@param card (table|Card)?
---@param only_visual boolean whether to only do the visual effects
---@param frac -- Fraction of chips and mult to balance
function swp_uti.apply_plasma_effect(card, only_visual, frac)
  -- Actually balance the chips and mult
  if not only_visual then
    local new_chips, new_mult = swp_uti.calculate_balance_frac(hand_chips, mult, frac)
    hand_chips = mod_chips(new_chips)
    mult = mod_mult(new_mult)
  end

  update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })

  -- Cosmetic effects
  G.E_MANAGER:add_event(Event({
    func = (function()
      -- Play sounds and change the color of the scoring values
      play_sound('gong', 0.94, 0.3)
      play_sound('gong', 0.94 * 1.5, 0.2)
      play_sound('tarot1', 1.5)
      ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
      ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })

      -- If a card was passed, show the balanced message on it
      if card then
        SMODS.calculate_effect({
          message = localize('k_balanced'),
          colour = { 0.8, 0.45, 0.85, 1 },
          instant = true
        }, card)
      end

      -- Return the colors to normal
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        delay = 4.3,
        func = (function()
          ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
          ease_colour(G.C.UI_MULT, G.C.RED, 2)
          return true
        end)
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        blockable = false,
        blocking = false,
        no_delete = true,
        delay = 6.3,
        func = (function()
          G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] =
              G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
          G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] =
              G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
          return true
        end)
      }))
      return true
    end)
  }))

  delay(0.6)
end

---@param chips number
---@param mult number
---@param frac number? -- Defaults to 1
---@return number
---@return number
function swp_uti.calculate_balance_frac(chips, mult, frac)
  if not frac then frac = 1 end
  local tot = (chips + mult) * frac
  return math.floor(chips * (1 - frac) + tot / 2), math.floor(mult * (1 - frac) + tot / 2)
end

---@param items table
---@param path string
function swp_uti.register_items(items, path)
    for i = 1, #items do
        SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
    end
end

--- Wrapper function around SMODS.pseudorandom_probability
---@param obj Card|table
---@param seed string|number
---@param base_numerator number|nil -- If skipped, defaults to 1
---@param base_denominator number|nil -- If skipped, tries to access `obj.ability.extra.odds`
---@param identifier string|nil -- If skipped, sets to `"paperback_" .. seed`
---@return boolean
function swp_uti.chance(obj, seed, base_numerator, base_denominator, identifier)
  return SMODS.pseudorandom_probability(
    obj,
    seed,
    base_numerator or 1,
    base_denominator or (obj.ability and obj.ability.extra and obj.ability.extra.odds),
    identifier or ('swp_' .. seed)
  )
end

--- Wrapper function around SMODS.get_probability_vars
---@param obj? Card|table
---@param identifier? string -- If skipped, tries to set it to `obj.config.center_key`
---@param base_numerator number|nil -- If skipped, defaults to 1
---@param base_denominator number|nil -- If skipped, tries to access `obj.ability.extra.odds`
---@return number numerator
---@return number denominator
function swp_uti.chance_vars(obj, identifier, base_numerator, base_denominator)
  -- todo: many calls to PB_UTIL.chance_vars don't use the same identifier
  -- as the corresponding PB_UTIL.chance
  -- (this doesn't matter much, we don't use identifiers)
  return SMODS.get_probability_vars(
    obj,
    base_numerator or 1,
    base_denominator or (obj and obj.ability and obj.ability.extra and obj.ability.extra.odds),
    identifier or (obj and obj.config and obj.config.center_key),
    false
  )
end

--- Adds a tag the same way vanilla does it
--- @param tag string | table a tag key or a tag table
--- @param event boolean? whether to send this in an event or not
--- @param silent boolean? whether to play a sound
function swp_uti.add_tag(tag, event, silent)
    local func = function()
        if not tag then
            local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed('swp_random_tag'))
            tag = Tag(selected_tag.key) --- for random tags
        elseif type(tag) == 'string' then
            tag = Tag(tag)
        end

        add_tag(tag)

        if not silent then
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
        end

        return true
    end

    if event then
        G.E_MANAGER:add_event(Event {
            func = func
        })
    else
        func()
    end
end