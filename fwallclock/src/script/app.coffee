stage = new PIXI.Stage(0xF1F1F1)

renderer = PIXI.autoDetectRenderer 1000, 1000

document.body.appendChild renderer.view

rectangle = PIXI.Rectangle(10, 10, 10, 10)

stage.addChild rectangle

animate = ->
  requestAnimFrame animate

  renderer.render stage

requestAnimFrame animate
