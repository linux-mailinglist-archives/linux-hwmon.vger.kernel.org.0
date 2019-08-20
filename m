Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9AEA96216
	for <lists+linux-hwmon@lfdr.de>; Tue, 20 Aug 2019 16:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbfHTOLz (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 20 Aug 2019 10:11:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35500 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730194AbfHTOLy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Aug 2019 10:11:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so2808375wmg.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Aug 2019 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=3A3veAm3Lpp8I1KUBVdHNM6t1y4gslFCu/nH33gQzj0=;
        b=UlFn4EbMZAEbKFED6p6zZZVirxz5HsF1OJcSpQzIPznev4XNwDnsO1YHKvTkKPcJjB
         3Ot35pW+7Hx6vbjXtLW6iLwRbjAHWbP+UcL3NfR0Vu/YAtXP3ELGvHb8/Vlcabio7nkf
         A9HTYmV3seHnrCTYdOhhrJcZXhU14qiDN2lAyQJ/0P+Vab9OcyJdra63NyeUudUjdTtW
         QLCAGVc5LB3PFzKuYyQmiJlaW0U0bZhY3MLwfPVPPesGkhjJBudkidVOh69hERvRZVfU
         Gf9mB086LUk6W1geanUZYyKuUBpilDfDen4K+fe0FtRb3bWFLlUktGHDf4XJiKPPHk8f
         Mv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:in-reply-to:references;
        bh=3A3veAm3Lpp8I1KUBVdHNM6t1y4gslFCu/nH33gQzj0=;
        b=MF8Eds10c+kx0Z6WlEQhrVmAoX/3L2Gbpp5L1nmxqq5yJqU2L9l469E00zh0qcxe3O
         U0M/dgdnP/Rt+Gqpdk2LdPkY81l8Dut5K+1HhCpupaa/d0Gxne84IfAEIpnf0AwKvqGs
         Gdhn8Q3ZZAih+CPac2NhnoGWmV9rPfdaKRy0NMshL1RyxF4ncVRQus3NXS6A2aujeq0k
         o5XXsHz/dYy5vKWPIz753ZUXnYgC33zlwX9tBWnx7bfLjobJ7guwjaSFtz1FW9ngtara
         eHg4gPo4Vv4AQycg6z6cskYs2t3A57MiTjK+TM/2vSy0PKdZegEERkdxmOkKJ3zw8zi+
         bDzA==
X-Gm-Message-State: APjAAAVPu4ymYJsaeJHIP3/im9XBJFwL8hwFrWh/WEv9Ure8q9E6aVuz
        nf2HQ50o/5G86TDPuA7ecHmoKQ==
X-Google-Smtp-Source: APXvYqxjghaCyCbikfVIF7P9kVbfPe71/TZPk84eJm5nxA4vZdhH9MGYRrqrXJuh7H9rsOBBIiEuuw==
X-Received: by 2002:a1c:d185:: with SMTP id i127mr207839wmg.63.1566310312089;
        Tue, 20 Aug 2019 07:11:52 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id f13sm10145717wrr.5.2019.08.20.07.11.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 07:11:51 -0700 (PDT)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 3/4] dt-bindings: Add optional label property for ina2xx
Date:   Tue, 20 Aug 2019 16:11:40 +0200
Message-Id: <3c56deb8cc1842d2915b203e622be1eb442414de.1566310292.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566310292.git.michal.simek@xilinx.com>
References: <cover.1566310292.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1566310292.git.michal.simek@xilinx.com>
References: <cover.1566310292.git.michal.simek@xilinx.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Using optional "label" property is adding an option to user to use better
name for device identification.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 Documentation/devicetree/bindings/hwmon/ina2xx.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
index 02af0d94e921..d15bf7e46fd7 100644
--- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
@@ -14,6 +14,8 @@ Optional properties:
 
 - shunt-resistor
 	Shunt resistor value in micro-Ohm
+- label
+	Symbolic name for a power monitor
 
 Example:
 
-- 
2.17.1

