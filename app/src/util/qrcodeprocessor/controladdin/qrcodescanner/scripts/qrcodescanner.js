var canvasInterval = window.setInterval(() => {
  processFrame();
}, 1000 / 60);

function Initiliaze() {
    const videoContainer = window.parent.document.querySelector(".react-html5-camera-photo");
    const video = videoContainer.querySelector("video");
    video.style.visibility = "hidden";
    video.style.width = "0px";
    video.style.height = "0px";
    const canvas = document.createElement('canvas');
    canvas.id = "stil-canvas";
    canvas.width = 400;
    canvas.height = 300;
    videoContainer.appendChild(canvas);

        video.onpause = function() {
          clearInterval(canvasInterval);
        };
        video.onended = function() {
          clearInterval(canvasInterval);
        };
        video.onplay = function() {
          clearInterval(canvasInterval);
          canvasInterval = window.setInterval(() => {
           processFrame();
          }, 1000 / 60);
        };
}

function processFrame () {
  // debugger;
  const videoContainer = window.parent.document.querySelector(".react-html5-camera-photo");
  const video = videoContainer.querySelector("video");
  if (video === null) return;
  const canvas = videoContainer.querySelector("#stil-canvas");
  const ctx = canvas.getContext("2d", { alpha: false });
    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
  // const code = await readBarcodeFromCanvas(canvas);
  // if (code.format) {
  //   alert(code.format + ": " + escapeTags(code.text));
  //   drawResult(code, ctx);
  // } else {
  //   console.log("No barcode found");
  // }
  requestAnimationFrame(processFrame());
}

function drawResult(code, ctx) {
  ctx.beginPath();
  ctx.lineWidth = 4;
  ctx.strokeStyle = "red";
  with (code.position) {
    ctx.moveTo(topLeft.x, topLeft.y);
    ctx.lineTo(topRight.x, topRight.y);
    ctx.lineTo(bottomRight.x, bottomRight.y);
    ctx.lineTo(bottomLeft.x, bottomLeft.y);
    ctx.lineTo(topLeft.x, topLeft.y);
    ctx.stroke();
  }
}

async function readBarcodeFromCanvas(canvas) {
  debugger;
  var zxing = ZXing().then(function (instance) {
    zxing = instance; // this line is supposedly not required but with current emsdk it is :-/
  });
  // const bitmap = await createImageBitmap(video);
  return;
  var _malloc = zxing._malloc;

  var imgWidth = canvas.width;
  var imgHeight = canvas.height;
  var imageData = canvas.getContext('2d').getImageData(0, 0, imgWidth, imgHeight);
  var sourceBuffer = imageData.data;

  if (zxing != null) {
    var buffer = zxing._malloc(sourceBuffer.byteLength);
		zxing.HEAPU8.set(sourceBuffer, buffer);
		var result = zxing.readBarcodeFromPixmap(buffer, imgWidth, imgHeight, true, "");
		zxing._free(buffer);
    return result;
  } else {
    return { error: "ZXing not yet initialized" };
  }
}

function escapeTags(htmlStr) {
  return htmlStr.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");
}