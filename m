Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE6525E7C2
	for <lists+linux-hwmon@lfdr.de>; Sat,  5 Sep 2020 15:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgIENHI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 5 Sep 2020 09:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgIENFw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 09:05:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E948FC061249
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 06:05:51 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id c10so8543853edk.6
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 06:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jbNBYJsjrynxmZsMzET80D74Cg5aetkjCqBMZs1glRY=;
        b=yNmUINmza9k+RTgHaXMy9Nuzc7/Hknt1zLTOYz8J0YBb/k1wMa/DF9mtRS8KmG5DsN
         aH6Mw2N0dAXjyO4lcED2y0TJLSY9W/hpSoo2jpOnhHDar7nIuTraTNSJy4tC/s58vmtd
         P2ysE6piC+hgCLm4v6M2Ds7sj8sLNeAIZIrnoyJAxlRI933pSVhLsXnNbf56NJJkJEyN
         KJMhB0+Pgk6Yw/QYdM8Up/luP1ZG9e4g8b8d8hn4Ocp9dL7WUAtZMA1bBX/AmPMP5sMu
         dhxV+bKeXkGVzH+3LBni/9wJBMPsu3SSYJ2xgXIQxczvS5t53Do4TbWRaCAVkrbC3Guc
         l35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jbNBYJsjrynxmZsMzET80D74Cg5aetkjCqBMZs1glRY=;
        b=o0EVukQhjufUEClN25DzmunroSXHE0y0N4ZOajk5SxaF4ILEZX47IC6r44pv16mkl2
         3t8CTwuDtRxJTttmFMut7AMI5bZ2Tlql9SIxX8G5eQeR9XW5RYcSwCRIInXU+BhNVKMT
         v3jeXQPc3NWkSIAH3AlqZjG/NCb3IZiNebGDAaCyvrtd1fcU+93zGC3X7aVTqol5+62o
         V0XSLZwOyal8fAzvUoMfkxQYIiWUOP6WyirIUkMi34W8TMs4ZbyKkWb2Aj3A0bB/5Uae
         IR/pXAsE3ResNxKSXpUO2xOnsbBxTMSP/HEbWrP9CAk7fxJeVPdO9Hll31w49Kr5GSf4
         //gQ==
X-Gm-Message-State: AOAM530Tc9HHtcp8ywuvcTo3MkcA32C1aVQVX2mgLIsSuJrqzYhXy9DB
        A2HD+qWHSyjQldtYsxp28LxDrQ==
X-Google-Smtp-Source: ABdhPJx/V0WmQvcU6/X0stOthigOnu+n8tOJtymLLR8nAcOmKK+z71JQtoB5PH2Cw0lJ8uSxHMD4+Q==
X-Received: by 2002:a50:d304:: with SMTP id g4mr13254256edh.248.1599311149280;
        Sat, 05 Sep 2020 06:05:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id s18sm9372655ejd.54.2020.09.05.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:05:48 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH 5/7] Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface documentation
Date:   Sat,  5 Sep 2020 15:03:34 +0200
Message-Id: <20200905130336.967622-6-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905130336.967622-1-luka.kovacic@sartura.hr>
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the iei-wt61p803-puzzle driver sysfs interface documentation to allow
monitoring and control of the microcontroller from user space.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 .../stable/sysfs-driver-iei-wt61p803-puzzle   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle

diff --git a/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle b/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
new file mode 100644
index 000000000000..36fca70d66ef
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
@@ -0,0 +1,65 @@
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/mac_address_*
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the internal iEi WT61P803 PUZZLE MCU MAC address values.
+		These are factory assigned and can be changed.
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/serial_number
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the internal iEi WT61P803 PUZZLE MCU serial number.
+		This value is factory assigned and can be changed.
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the internal iEi WT61P803 PUZZLE MCU version.
+		This value is read only.
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/protocol_version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the internal iEi WT61P803 PUZZLE MCU protocol version.
+		This value is read only.
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_loss_recovery
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the iEi WT61P803 PUZZLE MCU power loss recovery value.
+		This value is read write.
+		Value mapping: 0 - Always-On, 1 - Always-Off, 2 - Always-AC, 3 - Always-WA
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/bootloader_mode
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read whether the MCU is in bootloader mode.
+		This value is read only.
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the iEi WT61P803 PUZZLE MCU power status. Power status indicates
+		the power on method.
+		This value is read only.
+		Value mapping (bitwise list):
+		0x80 - Null
+		0x40 - Firmware flag
+		0x20 - Power loss detection flag (powered off)
+		0x10 - Power loss detection flag (AC mode)
+		0x08 - Button power on
+		0x04 - WOL power on
+		0x02 - RTC alarm power on
+		0x01 - AC recover power on
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/build_info
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the iEi WT61P803 PUZZLE MCU firmware build date.
+		This value is read only.
+		Format: yyyy/mm/dd hh:mm
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	Read the iEi WT61P803 PUZZLE MCU AC recovery status.
+		This value is read only.
-- 
2.20.1

