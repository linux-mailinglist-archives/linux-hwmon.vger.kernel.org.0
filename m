Return-Path: <linux-hwmon+bounces-350-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFAD804B60
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Dec 2023 08:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 987862816E5
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Dec 2023 07:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8322C847;
	Tue,  5 Dec 2023 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxajh1Qy"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639E1124;
	Mon,  4 Dec 2023 23:49:16 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58e256505f7so1805828eaf.3;
        Mon, 04 Dec 2023 23:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701762555; x=1702367355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWOVa9ZHl75zH5QJ3Y/fX8j6tatyjG0xsyOKgvDX6P8=;
        b=Dxajh1QyU8MOEuda/dRDtkwvkzxKLf/HdHVfGYGFZLwerpnkJBPyh1a+jHSTzP+E7s
         VMhPPk8kskqJEzj7gAed1VTTAevOxB1EL7TTMUu2wQGWYba/EtyE/QT091XdfL8Flupl
         1aphyTF5D2jUX/vYdHVq8VY1BwY7NS0ovfnAIAL2vNbP8xlohKE6pXp0jbDQF7ezd3VI
         S5Brg/usXcw8Jc9yJVlfeXe3NcGJLWjrl5TKs9DeQ5vqFCJA81AVO8saecqAJLNtrE0P
         7gBiqCS9ON0oLs9pMqFBomY0G0EeaVVtv+nTn1Jdw0JU+RKFnuG1rhdOzBrVM7iibjST
         S38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762555; x=1702367355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWOVa9ZHl75zH5QJ3Y/fX8j6tatyjG0xsyOKgvDX6P8=;
        b=Cf3wZ6FqK1wrIVqYBJmHpngVWTueaj4bNUa6qzlGypuDPbjAxWwWbFuIRe2HdvXuvI
         aL7hL22lbbuTzTKbVYrKSR92F4fc7NXG2GTiFuG/gVEjxD/g95AOLNxipTUetzxoLwBH
         Sjjm+7Zf5k7/hxhBZBHOs6rIEHVX54UAf7f/3j4QttSUDTEo6YKl0x9JftSInx5yYxgS
         tSviG01AbGTwG4ox4Q8IUY3jAm5gplXaSNHJNLaYYZnw4Rrefy5rJgLRhyrNtqM2Abw2
         qCIS0hSsBZUZyVSYsxq/4I/jEFc25wceqd2X0Ap7EO2Qh/56JLFILtV99KQI70wQBLG1
         tWzw==
X-Gm-Message-State: AOJu0YxjgLzkAaV3LAyTSf7Hz7Ye0VnfQVG3ecXQIV4idErBAJ/7tF9w
	oX0yPjaVDwWQQfwZfGOusDaQOJ55Gik=
X-Google-Smtp-Source: AGHT+IHBK0xQICO6yapyeE8DIDESIW2W/Vs1fD5iv7AcZ4w+KT1W6MIcEcSBg190jd0JarWvnmvZjw==
X-Received: by 2002:a05:6358:9106:b0:170:302b:545f with SMTP id q6-20020a056358910600b00170302b545fmr3323753rwq.56.1701762555605;
        Mon, 04 Dec 2023 23:49:15 -0800 (PST)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id k3-20020aa79983000000b006ce54e08b6asm2582529pfh.203.2023.12.04.23.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 23:49:15 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	macromorgan@hotmail.com,
	linus.walleij@linaro.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add asteralabs
Date: Tue,  5 Dec 2023 15:47:21 +0800
Message-Id: <20231205074723.3546295-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205074723.3546295-1-chou.cosmo@gmail.com>
References: <20231205074723.3546295-1-chou.cosmo@gmail.com>
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


