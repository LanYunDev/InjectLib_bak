let url = $request.url;

let paddleActivate = () => {
  if (url !== "https://v3.paddleapi.com/3.2/license/activate") return;
  let body = $request.body.split("&");
  let product_id = "";
  for (let k of body) {
    if (k.indexOf("product_id") != -1) {
      product_id = k.split("=")[1];
    }
  }

  $done({
    response: {
      body: JSON.stringify({
        success: true,
        response: {
          product_id: product_id,
          activation_id: "QiuChenly",
          type: "personal",
          expires: 1,
          expiry_date: 1999999999999,
        },
      }),
    },
  });
};

let paddleVerify = () => {
  let body = JSON.stringify({
    success: true,
    response: {
      type: "personal",
      expires: 1,
      expiry_date: 1999999999999,
    },
  });
  $done({
    response: {
      body,
    },
  });
};

paddleActivate();
paddleVerify();
