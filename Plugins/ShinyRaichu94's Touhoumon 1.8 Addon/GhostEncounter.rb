EventHandlers.add(:on_wild_pokemon_created, :ghost_encounter,
  proc { |pkmn|
    next if !$game_map.metadata&.has_flag?("Ghost")
    next if $game_map.metadata&.has_flag?("Ghost") && $bag.has?(:SILPHSCOPE)

    pkmn.name = "Ghost"
    pkmn.shiny = false
    pkmn.form = 1
  }
)
