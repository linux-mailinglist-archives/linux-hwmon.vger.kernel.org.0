Return-Path: <linux-hwmon+bounces-331-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE02802B77
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Dec 2023 06:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1237A1C2095B
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Dec 2023 05:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57BC539F;
	Mon,  4 Dec 2023 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIFNGNfq"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2EC95;
	Sun,  3 Dec 2023 21:57:47 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c673b01eeeso241672a12.1;
        Sun, 03 Dec 2023 21:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701669467; x=1702274267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H6eGxkIuJnwxIMsVrJhL0EVIrXnUAxwMRRf6LD+k5GI=;
        b=DIFNGNfqCZ8+QL6eIKVkn8686e8yop9I7zGyZ7HCJOOCwxdNSnCQLf5KReZO+22Z28
         0uaIGJlRA6gMWZsefcqNp6Dk25CKOsO4QCggFRFZdW0S20QKhnz5pJnBfs52Fn0BIqr6
         MLUVR6YdRjIhWMRkKHyuzanHgEzJ6FdSxizlvTe5J1u4SZF0aTt9sa5Y512fpxooWBnb
         j6zNvhC9UsLUim77RtTAeUCQDRQSwnpjj2AFp9uGcvZnOBQiic8XUMW5l/BzR0tKd81w
         33b29lZElJaS7njdxFoZdOgT1P/KtOQEnpIlCNz4lrdo3je0p+sXTd1fb0M7zx1eCsMp
         Aezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701669467; x=1702274267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6eGxkIuJnwxIMsVrJhL0EVIrXnUAxwMRRf6LD+k5GI=;
        b=pPhoXo/YG9uiNsBwAzG73OnVBQ9CLdO55uXqqLuiIYkxxVZpwSFCfhM7M8CZilyHRM
         N14sk670h2ZxfM7hBXNrlug37WbpXvb0zwF/TyiD6194EWtBTf11wAYgUShst3HM/weu
         G85deWlNCrfDPVwkZevX4ednJdJEib6CFVWvnKmG3Lop56pCxt8pAvQj5EYjZaXVx+OV
         TgaFSoANg1tQFpBbMBL1VVh53akGToUUp+C9caC3GWhdDRQe8GCpnfwDPOb9eNHbZFWh
         88DsVOMdJUSKWLhm2nbmySRSaTHBfSHlhTTM2YaXynTl5/2Qi2MPZureAzwFHmA2fe6H
         t3PA==
X-Gm-Message-State: AOJu0Yycp2lISih25V/xn4VzZQPkMN3QzC+I43QVE1ga7oToGbN94/ic
	6Dh2R0RofkCS7tA2YIPGmt4=
X-Google-Smtp-Source: AGHT+IEOxA1sezvW26X8BelxyvlD1wk8gx8+epLf3Bd/vLJ0JK2OJGjWJaqt5ocmFt3IBeAQm4kkug==
X-Received: by 2002:a17:90b:4d0c:b0:286:3b18:af40 with SMTP id mw12-20020a17090b4d0c00b002863b18af40mr1058284pjb.21.1701669466622;
        Sun, 03 Dec 2023 21:57:46 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 95-20020a17090a09e800b0028651ea5e7csm6113523pjo.33.2023.12.03.21.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 21:57:46 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	kwliu@nuvoton.com,
	kcfeng0@nuvoton.com,
	DELPHINE_CHIU@wiwynn.com,
	Bonnie_Lo@wiwynn.com,
	Ban Feng <baneric926@gmail.com>
Subject: [PATCH v1 0/2] hwmon: Driver for Nuvoton NCT736X
Date: Mon,  4 Dec 2023 13:56:48 +0800
Message-Id: <20231204055650.788388-1-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ban Feng <baneric926@gmail.com>

NCT736X is an I2C based hardware monitoring chip from Nuvoton.

Ban Feng (2):
  dt-bindings: hwmon: Add nct736x bindings
  hwmon: Driver for Nuvoton NCT736X

 .../bindings/hwmon/nuvoton,nct736x.yaml       |  80 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/nct736x.rst               |  35 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct736x.c                       | 479 ++++++++++++++++++
 7 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml
 create mode 100644 Documentation/hwmon/nct736x.rst
 create mode 100644 drivers/hwmon/nct736x.c

-- 
2.34.1


