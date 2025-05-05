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
    canvas.height = 220;
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
  const videoContainer = window.parent.document.querySelector(".react-html5-camera-photo");
  const video = videoContainer.querySelector("video");
  if (video === null) return;
  const canvas = videoContainer.querySelector("#stil-canvas");
  if (canvas === null) return;
  const ctx = canvas.getContext("2d", { willReadFrequently: true });
  ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
  readBarcodeFromCanvas(canvas).then(result => {
    if (result.format) {
      alert(result.format + ": " + escapeTags(result.text));
      drawResult(result, ctx);
    }
  });
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

function readBarcodeFromCanvas(canvas) {
  var imgWidth = canvas.width;
  var imgHeight = canvas.height;
  var imageData = canvas.getContext("2d", { willReadFrequently: true }).getImageData(0, 0, imgWidth, imgHeight);
  var sourceBuffer = imageData.data;
  return ZXing().then(function (zxing) {
    if (zxing) {
      var buffer = zxing._malloc(sourceBuffer.byteLength);
      zxing.HEAPU8.set(sourceBuffer, buffer);
      var result = zxing.readBarcodeFromPixmap(buffer, imgWidth, imgHeight, true, "");
      zxing._free(buffer);
      return result;
    } else {
      return { error: "ZXing not yet initialized" };
    }
  });
}

function escapeTags(htmlStr) {
  return htmlStr.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");
}