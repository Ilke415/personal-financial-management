
function InitiliazeUI() {
  const controladdinContainer = document.querySelector("#controlAddIn");
  const  scanQRCodeImage = document.createElement("img");
  scanQRCodeImage.setAttribute("src", `${Microsoft.Dynamics.NAV.GetImageResource(
    "./src/util/qrcodeprocessor/controladdin/assets/qr-code-scanner-icon.jpg")}`);
  scanQRCodeImage.setAttribute("height", "150");
  scanQRCodeImage.setAttribute("id", "scanQRCodeImage");
  scanQRCodeImage.setAttribute("width", "150");
  scanQRCodeImage.setAttribute("alt", "Scan QR Code");
  scanQRCodeImage.addEventListener("click", OnScanQRCodeImageClick, false);
  controladdinContainer.appendChild(scanQRCodeImage);

  // scanQRCodeImage = `<img id="scanQRCodeImage" src="${Microsoft.Dynamics.NAV.GetImageResource("./src/util/qrcodeprocessor/controladdin/assets/qr-code-scanner-icon.jpg")}" width="50" height="50" alt="Scan QR Code" />`;
  // controladdinContainer.insertAdjacentHTML("afterbegin", scanQRCodeImage);
}

function OnScanQRCodeImageClick() {
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnStartQRCodeScan", [{}, {}]);
}

async function ScanQRCodeImage(args, output) {
   
}

async function GetQRCodeImage()
{
   Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnScanQRCode", []);
   alert("GetQRCodeImage called from control add-in");
}

async function GenerateQRCode(args, output) {
  await GenerateQRCodeImpl(args, output);
}

async function GenerateQRCodeImpl(args, output) {
  debugger;
  const go = new Go();
  await WebAssembly.instantiateStreaming(
    fetch(
      Microsoft.Dynamics.NAV.GetImageResource(
        "src/controladdins/libs/qr-code-gen-lib.wasm"
      )
    ),
    go.importObject
  ).then((result) => {
    go.run(result.instance);
    output = getQRCode(args.content, args.size);
    const controladdinContainer = document.querySelector("#controlAddIn");

    const imageContainer = controladdinContainer.querySelector("img");

    if (imageContainer == null) {
      const htmlToInsert = `<img src="data:image/gif;base64,${output}" width="${args.size}" height="${args.size}"></img>`;
      controladdinContainer.innerHTML += htmlToInsert;
    } else {
      imageContainer.src = `data:image/gif;base64,${output}`;
    }
  });
}
