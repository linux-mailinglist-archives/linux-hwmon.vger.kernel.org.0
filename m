Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCA4226F88
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Jul 2020 22:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgGTUOb (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Jul 2020 16:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbgGTUOb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jul 2020 16:14:31 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596D2C0619D2
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2020 13:14:31 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id e127so14542817pgc.2
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2020 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=krJhVfJ5+Ckuq9PCZ6ReNrT3nN79ynOsubIFQ9bjPFU=;
        b=K9xpXhZgErGQGsCNHv6NSz6X1tT6aaqTl6hgTIO7ArQ5XkeWCK1Tq9qvYhfR9aMNwQ
         Ohur63BSOsP2v959h/f/i92I9t7Xuie7QEeRND/fHpx+oe04OGV3Pda48NVTMU91UyQG
         EewLAbILea9HMnQN12vwnOIYsDVOThmiyK8r/frWwoNoMutju3f8dIehVHPL7iGvkQTT
         MRyCKur0KBpFKBdDTwRK15Wnw9Uqiitqfq446kVQkDMUVKcPuqPFLrBMQ7rllDawpRqr
         w+lC3UoclqAeWeFjA8TlGU7Yy2Sj4bOVtQl5msDP28UKMUAW9CgLdSWBP7qAU0HmVoqe
         GYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=krJhVfJ5+Ckuq9PCZ6ReNrT3nN79ynOsubIFQ9bjPFU=;
        b=cTLMvvVr3N8BTWUw8zRJLd+X1E/D1W4qFqp1C/vj1lYCRKeHCRVTgqEXsFu8NISSbW
         OzRQE/sCGrbkQLV98YNvu5oZZBC5Yj1AbfiGeWGl7RwUyj6tLqcO5TbDTHQB3K9OXpA7
         gDYWzD40SvR0Yf43mv4DSGEn7wfIPWbTliCsv8Qrt8eHg4nCGf94P/Rsm/gGOcL0o25h
         9cAomoilkEVUFNR6j7Hoof+KkFKKfdwWuZXzia+kUq8htCKUOpBgY4hu+MGPIFwRaNvS
         YwjAlSkZstsH14I9WHZQGVFNju4CNx7mmXTNC+MshEbNeBCAkQDNgfGtnpMyGnJ+aENw
         IyRw==
X-Gm-Message-State: AOAM532KFOhSn3Ijo9tt2l0DsT/5m7melIqHjQlit/GAA4aLqDoE7lmQ
        +U3besZ5nBlByljoef/MQybwevV2nVBzXgQf
X-Google-Smtp-Source: ABdhPJxV4Zlcsi10sNbbXvZBXPQi8LKWus38AJAlk4iveR3bz+izOrpeCicWeLkzHq6K1HCP6piJMXv+3ln7898j
X-Received: by 2002:a17:90a:3044:: with SMTP id q4mr589631pjl.81.1595276070672;
 Mon, 20 Jul 2020 13:14:30 -0700 (PDT)
Date:   Mon, 20 Jul 2020 20:14:22 +0000
Message-Id: <20200720201422.1869389-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v2] dt-bindings: hwmon: adm1272: add analog-temperature1-enable
 binding
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, jdelvare@suse.com
Cc:     =belgaied@google.com, jasonling@google.com, linchuyuan@google.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqil@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Problem:
	adm1272 and adm1278 supports temperature sampling. The
current way of enabling it requires the user manually unbind the device
from the driver, flip the temperature sampling control bit and then bind
the device back to the driver. It would be nice if we can control this in a
better way by reading the dt.

Solution:
	Introducing device tree binding analog-temperature1-enable. If the
flag is set, flip the temp1_en control bit on probing.

Testing:
make dt_binding_check

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
ChangeLog v1->v2:
  - Rename adm1272-adm1278-temp1-en to analog-temperature1-enable

 Documentation/devicetree/bindings/hwmon/adm1275.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
index 1ecd03f3da4d..7a345c7794a2 100644
--- a/Documentation/devicetree/bindings/hwmon/adm1275.txt
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -15,6 +15,8 @@ Optional properties:
 
 - shunt-resistor-micro-ohms
 	Shunt resistor value in micro-Ohm
+- analog-temperature1-enable
+	Enable temperature sampling. This is supported on adm1272 and adm1278
 
 Example:
 
@@ -22,4 +24,5 @@ adm1272@10 {
 	compatible = "adi,adm1272";
 	reg = <0x10>;
 	shunt-resistor-micro-ohms = <500>;
+	analog-temperature1-enable;
 };
-- 
2.28.0.rc0.105.gf9edc3c819-goog

