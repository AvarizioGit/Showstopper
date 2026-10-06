if next(SMODS.find_mod('partner')) then
  -- Register the Partner cross-mod atlas
  SMODS.Atlas {
    key = 'partners',
    path = 'partners.png',
    px = 46,
    py = 58,
  }
  -- list of Partner keys
  local partners = {
    "triad",
    "agency",
    "crash",
    "poll",
    "identity",
    "blackcard",
  }

  swp_uti.register_items(partners, "crossmod/partners")
end

if next(SMODS.find_mod('CardSleeves')) then
  SMODS.Atlas {
    key = 'cardsleeves',
    path = 'CardSleeves.png',
    px = 73,
    py = 95
  }

  local sleeves = {
    'brown',
    'mashup',
    'picnic'
  }

  swp_uti.Sleeve = CardSleeves.Sleeve:extend {
    is_buffed = function(self)
      return self.get_current_deck_key() == self.deck_buff
    end,

    loc_key = function(self)
      return self:is_buffed() and (self.key .. '_buff')
    end,

    loc_vars = function(self, info_queue, card)
      return {
        key = self:loc_key()
      }
    end
  }

  swp_uti.register_items(sleeves, "crossmod/sleeves")
end