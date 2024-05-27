<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>A-Frame Computer Model</title>
        <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
    </head>
    <body>
    <a-scene>
        <!-- Import Computer Model -->
        <a-gltf-model id="computerModel" src="../Models/oldcomputer/scene.gltf" scale="1.5 1.5 1.5" position="0 0 -3" rotation="0 -90 0" computer-rotate></a-gltf-model>
    </a-scene>

    <script>
        AFRAME.registerComponent('computer-rotate', {
            init: function () {
                this.el.addEventListener('mousedown', this.onMouseDown.bind(this));
                this.el.addEventListener('mouseup', this.onMouseUp.bind(this));
                this.el.addEventListener('mouseleave', this.onMouseUp.bind(this));
                this.el.addEventListener('touchstart', this.onMouseDown.bind(this));
                this.el.addEventListener('touchend', this.onMouseUp.bind(this));
                this.rotationSpeed = 0.01;
                this.isMouseDown = false;
            },
            onMouseDown: function () {
                this.isMouseDown = true;
            },
            onMouseUp: function () {
                this.isMouseDown = false;
            },
            tick: function (time, deltaTime) {
                if (this.isMouseDown) {
                    const rotationY = this.el.object3D.rotation.y + this.rotationSpeed * deltaTime;
                    this.el.object3D.rotation.set(0, rotationY, 0);
                }
            }
        });
    </script>
</body>
</html>
