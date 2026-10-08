ItemHandlers::UseOnPokemon.add(:PINKANBERRY, proc { |item, qty, pkmn, scene|
  if pkmn.pinkPokemon? == true
    scene.pbDisplay(_INTL("It had no effect."))
    next false
  end
  pkmn.pink = true
  scene.pbRefresh
  scene.pbDisplay(_INTL("{1} turned pink!", pkmn.name))
  next true
})
