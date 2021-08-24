Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A6E3F5E4B
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Aug 2021 14:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbhHXMrl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 24 Aug 2021 08:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbhHXMrg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Aug 2021 08:47:36 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D2FC0613CF
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Aug 2021 05:46:52 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so2231471wml.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Aug 2021 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sV5bi/8/32uQJ63ILt7SV8uftT10eHMjtOEaunuG05M=;
        b=D4xeZ6Il7/TpovSdp6cBhIlgzF733gXgiHdK1AR2sEMG6GUdL8fZgop5meYE0aoupN
         FewCon2JtctS0mfG2zfLVWMAjUKldRRw3aVPERwzc/M/RWIOZfjEbpF4r1WnaAxpML7B
         qAejV7rQtR9g+hBZgy4G5Ml8K+GzxfFYQqTwnIuqYZZBejB1JMiSSQxJVrfri2g+LusL
         KfDtkYMdE5yrIaeu5johxOJM0dZdXeZ6H+yjIgoVZmWH464jJezCcifSpP+mnI60g5eQ
         wpdYycHnAT2lhf2BPz6VLZHI/hlDhUchgNXa85Ty7DdXu6T7E4IkEQAWxWgwsC1pYI7m
         0EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sV5bi/8/32uQJ63ILt7SV8uftT10eHMjtOEaunuG05M=;
        b=Hk0st/G8tx4Y1TIfruOSL15vj/91DMb6ohK/3f/8839+0rbrnJh3UUD+TV9X9HHaww
         swxdtME0+sYHdpCJp/H3izqbfa+unoM2H5WLZZS7blT9jWBXOQHH0Xl8ADCk8Oz9NcdD
         K3lrDh1WeflVDgF0Hh9ZRfiI+nYW1jPTbu+cQdDkesi4SIU2OvJXWad78OT84vGuqMD2
         4KcBHnxxDnvpV3mJGOzDYp06DDJ/BftbZbX4gwYLH3y5YlzrXhYpA09gesw+nTq7IQbs
         DyxmBFUlhUnYQCcspGx/Fktv9NQ71t+tT8ise65HmyzH/T78dp1lUfHMDxuDCWdfmR9B
         HJ6w==
X-Gm-Message-State: AOAM5300PGp4UBVY1ahCsTQOqyCnrsQPUR2YKRsVsYRIG94D0ZYBdj22
        LS/0XK7+V8I1+jtRL0/0jqp1Qw==
X-Google-Smtp-Source: ABdhPJyqY7PyhaU2K6nD0+z86vfEI4jeY/625pXpBJpDoe77q7569uA8pCW7P86FiH1hvhjVjZYnbQ==
X-Received: by 2002:a05:600c:1c9c:: with SMTP id k28mr4041526wms.148.1629809211135;
        Tue, 24 Aug 2021 05:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:50 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 5/7] Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface documentation
Date:   Tue, 24 Aug 2021 14:44:36 +0200
Message-Id: <20210824124438.14519-6-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824124438.14519-1-luka.kovacic@sartura.hr>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the iei-wt61p803-puzzle driver sysfs interface documentation to allow
monitoring and control of the microcontroller from user space.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../testing/sysfs-driver-iei-wt61p803-puzzle  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle

diff --git a/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle b/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
new file mode 100644
index 000000000000..ab4415587f67
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
@@ -0,0 +1,61 @@
+What:		/sys/bus/serial/devices/.../mac_address_*
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Internal factory assigned MAC address values
+
+What:		/sys/bus/serial/devices/.../serial_number
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Internal factory assigned serial number
+
+What:		/sys/bus/serial/devices/.../version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU firmware version
+
+What:		/sys/bus/serial/devices/.../protocol_version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU communication protocol version
+
+What:		/sys/bus/serial/devices/.../power_loss_recovery
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Host platform power loss recovery settings
+		Value mapping: 0 - Always-On, 1 - Always-Off, 2 - Always-AC, 3 - Always-WA
+
+What:		/sys/bus/serial/devices/.../bootloader_mode
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU bootloader mode status
+		Value mapping:
+		0 - normal mode
+		1 - bootloader mode
+
+What:		/sys/bus/serial/devices/.../power_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Power status indicates the host platform power on method.
+		Value mapping (bitwise list):
+		0x80 - Null
+		0x40 - Firmware flag
+		0x20 - Power loss detection flag (powered off)
+		0x10 - Power loss detection flag (AC mode)
+		0x08 - Button power on
+		0x04 - Wake-on-LAN power on
+		0x02 - RTC alarm power on
+		0x01 - AC recover power on
+
+What:		/sys/bus/serial/devices/.../build_info
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU firmware build date
+		Format: yyyy/mm/dd hh:mm
+
+What:		/sys/bus/serial/devices/.../ac_recovery_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Host platform AC recovery status value
+		Value mapping:
+		0 - board has not been recovered from power down
+		1 - board has been recovered from power down
-- 
2.31.1

