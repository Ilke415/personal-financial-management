function Initiliaze() {
  const controladdinContainer = document.querySelector("#controlAddIn");

  const scanQRCodeImage = document.createElement("img");
  scanQRCodeImage.setAttribute(
    "src",
    `${Microsoft.Dynamics.NAV.GetImageResource(
      "./src/util/qrcode_processing/controladdin/receipt_scanner/assets/qr-code-scanner-icon.jpg"
    )}`
  );
  scanQRCodeImage.setAttribute("height", "75");
  scanQRCodeImage.setAttribute("id", "scanQRCodeImage");
  scanQRCodeImage.setAttribute("width", "75");
  scanQRCodeImage.setAttribute("alt", "Scan QR Code");
  scanQRCodeImage.addEventListener("click", OnScanFromImagesClick, false);
  controladdinContainer.appendChild(scanQRCodeImage);

  const scanFromURLImage = document.createElement("img");
  scanFromURLImage.setAttribute(
    "src",
    `${Microsoft.Dynamics.NAV.GetImageResource(
      "./src/util/qrcode_processing/controladdin/receipt_scanner/assets/url-icon.jpg"
    )}`
  );
  scanFromURLImage.setAttribute("height", "75");
  scanFromURLImage.setAttribute("id", "scanFromURLImage");
  scanFromURLImage.setAttribute("width", "75");
  scanFromURLImage.setAttribute("alt", "Scan QR Code");
  scanFromURLImage.addEventListener("click", OnScanFromImagesClick, false);
  controladdinContainer.appendChild(scanFromURLImage);
}

function OnScanFromImagesClick() {
  debugger;
  let actionId;
  if (this.id === "scanQRCodeImage") {
    actionId = 0;
  } else if (this.id === "scanFromURLImage") {
    actionId = 1;
  }

  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnScanRequestStart", [
    { actionId: actionId },
    {},
  ]);
}
