
function Initiliaze() {
  const controladdinContainer = document.querySelector("#controlAddIn");
  
  const  scanQRCodeImage = document.createElement("img");
  scanQRCodeImage.setAttribute("src", `${Microsoft.Dynamics.NAV.GetImageResource(
    "./src/util/qrcodeprocessor/controladdin/qrcodeprocessor/assets/qr-code-scanner-icon.jpg")}`);
  scanQRCodeImage.setAttribute("height", "75");
  scanQRCodeImage.setAttribute("id", "scanQRCodeImage");
  scanQRCodeImage.setAttribute("width", "75");
  scanQRCodeImage.setAttribute("alt", "Scan QR Code");
  scanQRCodeImage.addEventListener("click", OnScanFromImagesClick, false);
  controladdinContainer.appendChild(scanQRCodeImage);

  const  scanFromURLImage = document.createElement("img");
  scanFromURLImage.setAttribute("src", `${Microsoft.Dynamics.NAV.GetImageResource(
    "./src/util/qrcodeprocessor/controladdin/qrcodeprocessor/assets/url-icon.jpg")}`);
  scanFromURLImage.setAttribute("height", "75");
  scanFromURLImage.setAttribute("id", "scanFromURLImage");
  scanFromURLImage.setAttribute("width", "75");
  scanFromURLImage.setAttribute("alt", "Scan QR Code");
  scanFromURLImage.addEventListener("click", OnScanFromImagesClick, false);
  controladdinContainer.appendChild(scanFromURLImage);
}

function OnScanFromImagesClick() {
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnStartQRCodeScan", [{}, {}]);
}

async function ScanQRCode(args, output) {
   await ScanQRCodeImpl(args, output);
}

async function ScanQRCodeImpl(args, output) {
  const go = new Go();
  await WebAssembly.instantiateStreaming(
    fetch(
      Microsoft.Dynamics.NAV.GetImageResource(
        "./src/util/qrcodeprocessor/controladdin/libs/readqr.lib.wasm"
      )
    ),
    go.importObject
  ).then((result) => {
    go.run(result.instance);
    output = getQRCode(args.content, args.size);
   
    
  });
}