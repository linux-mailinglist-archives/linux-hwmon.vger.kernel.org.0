Return-Path: <linux-hwmon+bounces-249-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F17E7FDC38
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Nov 2023 17:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE4F1282660
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Nov 2023 16:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0553987D;
	Wed, 29 Nov 2023 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjE2D8TV"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A3BBF;
	Wed, 29 Nov 2023 08:08:43 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332f4ad27d4so3224077f8f.2;
        Wed, 29 Nov 2023 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701274122; x=1701878922; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/s7tfH+s13XLFwpsHWisZcRoq3LF8Pf8IiIZG7gEgrs=;
        b=XjE2D8TVefcp7jTb2naktIy7oo5tZEehfrNBzDDCWP8TqSIc3iUeSXwlTAaIxo5v8V
         ZCoYskBq4GLY6esoXcrkPjNYabubAj6hsXz5mTU7qlly+LeZg4Xdc7FMnV/jGQQpEA+C
         N8EzrGgnXS5lgtiKCpN0iC6XRT5ZOkVBU/hVpVFhtoDnEoMCMOL8wmYxceSs4m45dV8J
         5oSFib7tXFffAfVNS8RH88Aujana7QWHeJ3taUj7ZpJWCMF9q6wdOOgf+eMLGQf09Of7
         Nu8VQso8UkzRlaoKbopmQxRY8fkbPmLYn7GFCb1wvzQ1XHFK7eFGgGcIEZ6dApvl8u/n
         oaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274122; x=1701878922;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/s7tfH+s13XLFwpsHWisZcRoq3LF8Pf8IiIZG7gEgrs=;
        b=dMSWd0mq+KKk7eyfx8prO7lHa7fYXBEhxrSBjKR2uTTLkRNgScZx+b2XWJy65Ii5OV
         vEvO8pte5RE/HlSTZGJtRb8CNrzcWrvvb4r5vNf8+Cj+sKBzSvEBfBq71O5cEz7NCXLr
         bD1ExCyqU8Xy2K9ebV9uS1mmhehZGftqU3wVC26VU7J6HiNFamJbPe22ygjGV5vNKmNE
         gE6MDYgHUgzwVjGHsqCIv95s66OXpiCSSqCPX3pBsrq4d4IlI4gUtsbpQWIY4tVVloJ2
         /G22kpcBNIXJqD3FdcKdiqrz508Gk31/kibK+M53nJ/HgAHDTogFjUikWYeGMTTiGVNk
         o0EQ==
X-Gm-Message-State: AOJu0Yzx5bzPTnd9Ln5WKCcO+mZy6hFVyEi9pBL+3qd690M8+XGEABhx
	LLQ+x87GXbx+v/SWY6tOI/NdUC8RMpvuMrCE
X-Google-Smtp-Source: AGHT+IEwT3r2gtetU32HTJOsQbnk/j8Zgv9lb4aaupluwAm7hjuO8sKHI5Wv5hbd5W4aUVAOdwXaEw==
X-Received: by 2002:a5d:6dca:0:b0:333:189e:b6be with SMTP id d10-20020a5d6dca000000b00333189eb6bemr1490899wrz.31.1701274121844;
        Wed, 29 Nov 2023 08:08:41 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id m21-20020a056000181500b00332f82265b8sm12096322wrh.4.2023.11.29.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:08:41 -0800 (PST)
Message-ID: <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>
Date: Wed, 29 Nov 2023 17:08:41 +0100
In-Reply-To: <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gV2VkLCAyMDIzLTExLTI5IGF0IDE1OjQ5ICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+
IEhpIE51bm8sCj4gCj4gR1BJTy1yZWxhdGVkIHJldmlldyBhcyByZXF1ZXN0ZWQhIFRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKPiAKPiBPbiBGcmksIE5vdiAyNCwgMjAyMyBhdCAzOjE44oCvUE0gTnVu
byBTYSB2aWEgQjQgUmVsYXkKPiA8ZGV2bnVsbCtudW5vLnNhLmFuYWxvZy5jb21Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gCj4gPiArY29uZmlnIFNFTlNPUlNfTFRDNDI4Mgo+ID4gK8KgwqDCoMKgwqDC
oCB0cmlzdGF0ZSAiQW5hbG9nIERldmljZXMgTFRDNDI4MiIKPiA+ICvCoMKgwqDCoMKgwqAgZGVw
ZW5kcyBvbiBJMkMKPiA+ICvCoMKgwqDCoMKgwqAgc2VsZWN0IFJFR01BUF9JMkMKPiAKPiBzZWxl
Y3QgR1BJT0xJQgo+IAoKSG1tIGFscmlnaHQsIHRoZSBvbmx5IHJlYXNvbiB3aHkgSSBkaWRuJ3Qg
ZG8gdGhpcyBpcyBiZWNhdXNlIGdwaW9jaGlwIGlzIGFuIG9wdGlvbmFsCmZlYXR1cmUgZm9yIHRo
ZSBkcml2ZXIuIFNvIEkgaGF2ZSBhbiAnIUlTX0VOQUJMRUQoQ09ORk9HX0dQSU9MSUIpJyBndWFy
ZCBpbiB0aGUKYmVnaW5uaW5nIG9mIHRoZSBmdW5jdGlvbi4gQnV0IHllYWgsIHdpbGwganVzdCBk
byB0aGlzLiBPZGRzIGFyZSB0aGF0IGdwaW8gaXMgYWxyZWFkeQplbmFibGVkIGFueXdheXMuCgo+
IHBvdGVudGlhbGx5IGFsc28KPiAKPiBzZWxlY3QgR1BJT19SRUdNQVAsIHNlZSBiZWxvdy4KPiAK
PiA+ICtzdHJ1Y3QgbHRjNDI4Ml9ncGlvIHsKPiA+ICvCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAq
IGNvbnN0ICpmdW5jczsKPiA+ICvCoMKgwqDCoMKgwqAgdTMyIG91dF9yZWc7Cj4gPiArwqDCoMKg
wqDCoMKgIHUzMiBvdXRfbWFzazsKPiA+ICvCoMKgwqDCoMKgwqAgdTMyIGluX3JlZzsKPiA+ICvC
oMKgwqDCoMKgwqAgdTMyIGluX21hc2s7Cj4gPiArwqDCoMKgwqDCoMKgIGJvb2wgYWN0aXZlX2hp
Z2g7Cj4gPiArwqDCoMKgwqDCoMKgIHU4IG5fZnVuY3M7Cj4gPiArfTsKPiAKPiBTbyBwcmV0dHkg
c2ltcGxlIGRlZGljYXRlZCBiaXRzLgo+IAo+ID4gK3N0YXRpYyBpbnQgbHRjNDI4Ml9ncGlvX2lu
cHV0X3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQo+ID4g
K3sKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGx0YzQyODJfc3RhdGUgKnN0ID0gZ3Bpb2NoaXBf
Z2V0X2RhdGEoY2hpcCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIC8qIHdlIGNhbiBvbmx5IGNv
bnRyb2wgdGhpcyBmb3IgR1BJT18xICovCj4gPiArwqDCoMKgwqDCoMKgIGlmIChvZmZzZXQgIT0g
TFRDNDI4Ml9HUElPXzEpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIHJlZ21hcF9zZXRfYml0cyhzdC0+bWFw
LCBMVEM0MjgyX0dQSU9fQ09ORklHLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRDNDI4Ml9HUElPXzFfQ09ORklHX01BU0sp
Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGx0YzQyODJfZ3Bpb19vdXRwdXRfc2V0KHN0
cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBvZmZzZXQsCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludCB2YWwpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgbHRjNDI4Ml9zdGF0ZSAq
c3QgPSBncGlvY2hpcF9nZXRfZGF0YShjaGlwKTsKPiA+ICvCoMKgwqDCoMKgwqAgY29uc3Qgc3Ry
dWN0IGx0YzQyODJfZ3BpbyAqZ3BpbyA9ICZsdGM0MjgyX2dwaW9zW29mZnNldF07Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgIGd1YXJkKG11dGV4KSgmc3QtPmxvY2spOwo+ID4gK8KgwqDCoMKgwqDC
oCAvKgo+ID4gK8KgwqDCoMKgwqDCoMKgICogRXhwbGljaXRseSBzZXR0aW5nIHRoZSBwaW4gYXMg
b3V0cHV0IGNhbiBvbmx5IGJlIGRvbmUgZm9yIEdQSU9fMS4gRm9yCj4gPiArwqDCoMKgwqDCoMKg
wqAgKiB0aGUgb3RoZXIgcGlucyB3ZSBqdXN0IHB1bGwgdGhlIGxpbmUgZG93biBvciBoaWdoLXou
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ICvCoMKgwqDCoMKgwqAgaWYgKG9mZnNldCA9PSBM
VEM0MjgyX0dQSU9fMSkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHJl
dDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHJlZ21hcF91
cGRhdGVfYml0cyhzdC0+bWFwLCBMVEM0MjgyX0dQSU9fQ09ORklHLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBMVEM0MjgyX0dQSU9fMV9DT05GSUdfTUFTSywKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRklFTERfUFJFUChMVEM0MjgyX0dQSU9fMV9DT05GSUdfTUFTSywKPiA+IDIpKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiA+ICvCoMKg
wqDCoMKgwqAgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCAvKgo+ID4gK8KgwqDCoMKgwqDCoMKg
ICogR1BJT18yLDMgYW5kIHRoZSBBTEVSVCBwaW4gcmVxdWlyZSBzZXR0aW5nIHRoZSBiaXQgdG8g
MSB0byBwdWxsIGRvd24KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIHRoZSBsaW5lCj4gPiArwqDCoMKg
wqDCoMKgwqAgKi8KPiA+ICvCoMKgwqDCoMKgwqAgaWYgKCFncGlvLT5hY3RpdmVfaGlnaCkKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9ICF2YWw7Cj4gPiArCj4gPiArwqDC
oMKgwqDCoMKgIHJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgZ3Bpby0+b3V0X3Jl
ZywgZ3Bpby0+b3V0X21hc2ssCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWVsZF9wcmVwKGdwaW8tPm91dF9tYXNr
LCB2YWwpKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgbHRjNDI4Ml9ncGlvX3NldChz
dHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgdmFsKQo+
ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGx0YzQyODJfc3RhdGUgKnN0ID0gZ3Bpb2No
aXBfZ2V0X2RhdGEoY2hpcCk7Cj4gPiArwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBsdGM0Mjgy
X2dwaW8gKmdwaW8gPSAmbHRjNDI4Ml9ncGlvc1tvZmZzZXRdOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoCBpZiAoIWdwaW8tPmFjdGl2ZV9oaWdoKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdmFsID0gIXZhbDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcmVnbWFwX3VwZGF0ZV9i
aXRzKHN0LT5tYXAsIGdwaW8tPm91dF9yZWcsIGdwaW8tPm91dF9tYXNrLAo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpZWxkX3ByZXAoZ3Bp
by0+b3V0X21hc2ssIHZhbCkpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGx0YzQyODJf
Z3Bpb19nZXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZnNldCkKPiA+
ICt7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBsdGM0MjgyX3N0YXRlICpzdCA9IGdwaW9jaGlw
X2dldF9kYXRhKGNoaXApOwo+ID4gK8KgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbHRjNDI4Ml9n
cGlvICpncGlvID0gJmx0YzQyODJfZ3Bpb3Nbb2Zmc2V0XTsKPiA+ICvCoMKgwqDCoMKgwqAgaW50
IHJldDsKPiA+ICvCoMKgwqDCoMKgwqAgdTMyIHZhbDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAg
cmV0ID0gcmVnbWFwX3JlYWQoc3QtPm1hcCwgZ3Bpby0+aW5fcmVnLCAmdmFsKTsKPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biByZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAhISh2YWwgJiBncGlvLT5pbl9t
YXNrKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBsdGM0MjgyX2dwaW9fdmFsaWRfbWFz
ayhzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICp2
YWxpZF9tYXNrLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbmdwaW9zKQo+ID4gK3sKPiA+
ICvCoMKgwqDCoMKgwqAgc3RydWN0IGx0YzQyODJfc3RhdGUgKnN0ID0gZ3Bpb2NoaXBfZ2V0X2Rh
dGEoY2hpcCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgICp2YWxpZF9tYXNrID0gc3QtPnZhbGlk
X21hc2s7Cj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ID4gK30KPiAKPiBTb21lIG9mIHRo
aXMgbG9va3MgbGlrZSBpdCBjb3VsZCB1c2UgR1BJT19SRUdNQVAsIGxvb2sgaW50byBvdGhlcgo+
IGRyaXZlcnMgdXNpbmcgdGhlc2UgaGVscGVycyBzdWNoIGFzCj4gZHJpdmVycy9ncGlvL2dwaW8t
ZHM0NTIwLmMgYW5kIHNlZSBob3cgc21hbGwgaXQgYmVjb21lcy4KPiAKPiBJdCBtYXkgb3IgbWF5
IG5vdCBoZWxwIHlvdS4gQnV0IHRha2UgYSBsb29rLgo+IAoKT2ssIHdpbGwgbG9vayBhdCBpdC4K
Cj4gT3RoZXIgdGhhbiB0aGF0IGl0IGxvb2tzIGZpbmUuCj4gCgpDb29sLCBJIGFjdHVhbGx5IHRo
b3VnaHQgdGhhdCBoYXZpbmcgdGhlIGRpcmVjdGlvbiArIGdldC9zZXQgc3R1ZmYgd291bGQgYmUg
d2VpcmQKZ2l2ZW4gdGhlIGZhY3QgdGhhdCB3ZSBjYW4gb25seSBQVUxMX0xPVyBvciBISUdIX1og
dGhlIHBpbnMuCgpUaGFua3MhCi0gTnVubyBTw6EKCg==


