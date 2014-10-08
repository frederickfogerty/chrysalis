stage = new PIXI.Stage(0xF1F1F1)

renderer = PIXI.autoDetectRenderer 1000, 1000

document.body.appendChild renderer.view

animate = ->
  requestAnimFrame animate

  renderer.render stage

requestAnimFrame animate
