Return-Path: <linux-hwmon+bounces-475-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FA8127AA
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 Dec 2023 07:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12EBF1F21B41
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 Dec 2023 06:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C47579E3;
	Thu, 14 Dec 2023 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOTig6Qz"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BB5114;
	Wed, 13 Dec 2023 22:06:13 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c21e185df5so6697928a12.1;
        Wed, 13 Dec 2023 22:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702533973; x=1703138773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWOVa9ZHl75zH5QJ3Y/fX8j6tatyjG0xsyOKgvDX6P8=;
        b=dOTig6QzIeI8xqQzu/u4a2TW1CVOMEiT+X4/Rj9k28AO1LFIolboFSJ9cP6q93Lj6H
         oje+IK/lUi0bQEoCi/mg0DAWZsHU0ufWHQgyXLIZURwidETQnoSycgiQTedNvy3o5iPc
         YqEg5CkpUkYuWQ4CT9gBLHvkH/4BR4J/a+k9Q+g5CgfYU+TPUgVyrimg+5vuBDFQ8eS7
         I+U5XIUNyAjeG5tJx6b7SRXkvKS43aCeuZJrfSoUu9PhveoLbVB5kcth82gQXNF59ocS
         18oFbZ+sjsCvDzB6xwlLkiapRcm8HQXNdGKM7Q3Zbiw7Y7PGl+FRRTiS3CLUh4DITgQk
         Uw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702533973; x=1703138773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWOVa9ZHl75zH5QJ3Y/fX8j6tatyjG0xsyOKgvDX6P8=;
        b=Ve74tWLILqfddrxPWUrtIJAedqp1rBBih/uuv0CkeNUTiV/bNIRpFOsUoKcquCmsMy
         PhUNkF5YzTFrgtKEFDg2mTnfWt3ZN4q5CepSSvqRgciE3feL2O5galIlRoCwb7JRJTJv
         XHIdxEweN8LbyRBdm1soI1yMowMX9JecLgcGc6QhGaoh4CpVXMMcOw4oHSU3guj+RRmS
         hBOEqMBY7trhkXGCqZb/ctFXTSdIRtbWp/fDTE10X4Ti7gd3ZiPwDXGQ3WQUyQz4oqaL
         R2fBKFd7N1f1IaON6C7QfOs/3s27VqYmbIuwOosSRkiLldY2AcCTFNTsiCJqWm35J4O+
         tJ+A==
X-Gm-Message-State: AOJu0YycZGd1a8utBiR2nWJ9UyvO1FUQr/0gRp/sJZe5phElNavQQm3x
	xbSN/5wzuDLimDrFWvs4MkA=
X-Google-Smtp-Source: AGHT+IHQNwsax/3aq8g7egYXepOelV+aqN36fQbZbB//oPo8ZjvKZ+RnGLTefBm81ehHA92FEGVe2A==
X-Received: by 2002:a05:6a20:9381:b0:190:d456:fb2f with SMTP id x1-20020a056a20938100b00190d456fb2fmr9589828pzh.96.1702533972688;
        Wed, 13 Dec 2023 22:06:12 -0800 (PST)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id p11-20020a17090a2d8b00b0028ae812da81sm2373327pjd.8.2023.12.13.22.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 22:06:11 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	corbet@lwn.net,
	broonie@kernel.org,
	naresh.solanki@9elements.com,
	vincent@vtremblay.dev,
	patrick.rudolph@9elements.com,
	luca.ceresoli@bootlin.com,
	bhelgaas@google.com,
	festevam@denx.de,
	alexander.stein@ew.tq-group.com,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	macromorgan@hotmail.com,
	forbidden405@foxmail.com,
	sre@kernel.org,
	linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add asteralabs
Date: Thu, 14 Dec 2023 14:05:50 +0800
Message-Id: <20231214060552.2852761-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214060552.2852761-1-chou.cosmo@gmail.com>
References: <20231214060552.2852761-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Astera Labs, Inc.
https://www.asteralabs.com

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..5c49f63d4ef0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -155,6 +155,8 @@ patternProperties:
     description: ASPEED Technology Inc.
   "^asrock,.*":
     description: ASRock Inc.
+  "^asteralabs,.*":
+    description: Astera Labs, Inc.
   "^asus,.*":
     description: AsusTek Computer Inc.
   "^atheros,.*":
-- 
2.34.1


