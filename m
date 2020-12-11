Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A49E2D815B
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Dec 2020 22:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391179AbgLKV4c (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 11 Dec 2020 16:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390501AbgLKVz4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Dec 2020 16:55:56 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24454C0617A7
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 13:54:40 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id 102so7380226qva.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 13:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=NTgAB1mD14VMd3H1Bqnr5TwzQles0E7KUIMRK7pxIo4=;
        b=Ei3QYeJaw8u4bJidom09HkjHpuNV7TW9znoZOUb4X/jhtx5u9U56HbhV+e516TF4hb
         jMB34gJcOiEZVx+fMAoVtd2qcWnyt+PmV/MnDZvivzmRyULPhLwARgL284zy+Dv+Tho2
         +/ABEs3efbNCRvq/WLBlQDJXGtffyi1nhN0kbgqpmzfot6OoYLqM+jKzg1gsGCz8AEza
         eZOhhV7W3kwLJcu2n31rHlOuZ+pre9AQx8+zb9NPvCnnIpv72c0zfQ+yJONXMVQO4FlB
         IneCRunuV8ftUt56bvXRXnF0OlJgLXClej/rWPmZ7ONQb3ekrOU4Qt9TiY7wyS3zIyrx
         6EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NTgAB1mD14VMd3H1Bqnr5TwzQles0E7KUIMRK7pxIo4=;
        b=UbYQ7eKR+0eLgVsmqndyEkZtZ/cTTBuy0Z0kZHgWsNcU2OKAubild7OzeTEoqYRSJY
         sAICVMV5M1L5Si5eUBLmm9Uz7uX16WvkjZVU9IVgrL/VCulxQIOE686dZiiBiXtN+g7N
         wfslv/UROQeD78wF5+X8d4kUlbKeDKIGZT00CjEW2PjbQj2xWnCs0mx96umuW2pTUjux
         NNeDfXpRBC/JWfxEtOu3RZXhYLQtH7srvO27a1e8QhDjf7uYCWLWfMzGSRwA8JaudLkm
         n4C+bbQzcpXCz535rsMhjgNpqBfyvrCOkUvpNJZi01zVLq8LuISov7rMo73C45PTbRmn
         D6dw==
X-Gm-Message-State: AOAM532Tf6nfd2YiCInlcRdoWy7pdGR7XZUnluJtXSSaaJlbjtvHQVt/
        wO1wWSoURH/B5clYZ+mNj971O0xzbg==
X-Google-Smtp-Source: ABdhPJyVa+Y3FutrLWi8X1KGlRYrBlVNq40nJupQDbBYEPgST1GAmYH1QW4XMUiAfDuET0G/NH3iztLh+Q==
Sender: "kunyi via sendgmr" <kunyi@kunyi0.svl.corp.google.com>
X-Received: from kunyi0.svl.corp.google.com ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a0c:bd2b:: with SMTP id m43mr17844211qvg.32.1607723679283;
 Fri, 11 Dec 2020 13:54:39 -0800 (PST)
Date:   Fri, 11 Dec 2020 13:54:26 -0800
In-Reply-To: <20201211215427.3281681-1-kunyi@google.com>
Message-Id: <20201211215427.3281681-3-kunyi@google.com>
Mime-Version: 1.0
References: <20201211215427.3281681-1-kunyi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH linux hwmon-next v5 2/3] hwmon: (sbtsi) Add documentation
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, supreeth.venkatesh@amd.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/index.rst      |  1 +
 Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fd6fae46b99c..509fb3bcafb2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -151,6 +151,7 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    raspberrypi-hwmon
+   sbtsi_temp
    sch5627
    sch5636
    scpi-hwmon
diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..9f0f197c8aa2
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,40 @@
+Kernel driver sbtsi_temp
+==================
+
+Supported hardware:
+
+  * Sideband interface (SBI) Temperature Sensor Interface (SB-TSI)
+    compliant AMD SoC temperature device.
+
+    Prefix: 'sbtsi_temp'
+
+    Addresses scanned: This driver doesn't support address scanning.
+
+    To instantiate this driver on an AMD CPU with SB-TSI
+    support, the i2c bus number would be the bus connected from the board
+    management controller (BMC) to the CPU. The i2c address is specified in
+    Section 6.3.1 of the SoC register reference: The SB-TSI address is normally
+    98h for socket 0 and 90h for socket 1, but it could vary based on hardware
+    address select pins.
+
+    Datasheet: The SB-TSI interface and protocol is available as part of
+               the open source SoC register reference at:
+
+	       https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+               The Advanced Platform Management Link (APML) Specification is
+               available at:
+
+	       http://developer.amd.com/wordpress/media/2012/10/41918.pdf
+
+Author: Kun Yi <kunyi@google.com>
+
+Description
+-----------
+
+The SBI temperature sensor interface (SB-TSI) is an emulation of the software
+and physical interface of a typical 8-pin remote temperature sensor (RTS) on
+AMD SoCs. It implements one temperature sensor with readings and limit
+registers encode the temperature in increments of 0.125 from 0 to 255.875.
+Limits can be set through the writable thresholds, and if reached will trigger
+corresponding alert signals.
-- 
2.29.2.684.gfbc64c5ab5-goog

