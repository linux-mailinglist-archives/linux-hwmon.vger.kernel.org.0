Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28341227734
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Jul 2020 05:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgGUDsa (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Jul 2020 23:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgGUDsa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jul 2020 23:48:30 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F78AC061794
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2020 20:48:30 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id k7so1245398pjw.2
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2020 20:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ViVaDO5oP+OL8w0ZrOLdN+B0u9kKdP2UMYXI8VNm2p4=;
        b=NngNwvlKr8DyPwkp6B8Cc9RgoKa0fgLTu9HvA6JSLDLnjlF+OpYt9A3XH8Qqn1/pLF
         uD2aAHCoIZMOSnB2bOd/1Q26Y+v9ohVWPhQoJp6CalGkutOcaD4hlhIrCY/q2/SHk9Xf
         I+fUzvzxM4+u/HEo7Hq+Gwt56qFHh6hIFuShM8tOxmJxbCcwfbZr9TUZnKRaz5D3jIXH
         +T9mqeldkMRLLJrc0XkdqNbEVooQ/E/FSD/fIpbbSselQX+vU16xBtbYcJ0swrD209dq
         JATvN7fyE5JZsPxwOcYQKfisTUEv4F7Ky7kjGRxl3g6BL3qBWjikZUfWyXmcWFrNoxOp
         xRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ViVaDO5oP+OL8w0ZrOLdN+B0u9kKdP2UMYXI8VNm2p4=;
        b=j9/NYXeeg0XSnvn/rkJQfvWr16683CUlWwMEKEKNTJYV69eOIzdPP+momkeucvm+Iz
         OsubWLY3WTDOj6lPs2cFR8Zg2yTET96h9uTKqo6E6v4opKCm68uizfLtlKWE/51A951v
         zojV1sABKhBJ5AlcC2sW/Vjz/AcvkDJUPCHaDukOIhA3rDQNU2hjVnUNVQjXrP71xojg
         zZ0avuD4hKmd5GH/e68SPdQUKmkmNi6i/iN9qPXhGg5hAalca0RiLOqtxYKDuNeuK6v2
         EUUVgbb/08ByyEeA83t/xn+zY7IWD9gTe9VGrjKYz8LztNAg2KXt4PYIVU1xSqzZZFKt
         0Mag==
X-Gm-Message-State: AOAM533nCmEaDzWNR2xjn23cN12XuYQMzxPaKuJeM0QKTVZ2ixh3eYoh
        rSnxUxTUuxmQuMKk32mFvVf/X4x1KqnTgdEh
X-Google-Smtp-Source: ABdhPJxO6ZsGscYpNxobxUu8cxt3GraaIqR1qtuyR+YRtt2KMInQAweh7GiWeUMWYQQ2lo4wu0IdvNNucNnpivqJ
X-Received: by 2002:a17:902:ac88:: with SMTP id h8mr18410229plr.220.1595303309733;
 Mon, 20 Jul 2020 20:48:29 -0700 (PDT)
Date:   Tue, 21 Jul 2020 03:48:15 +0000
Message-Id: <20200721034815.2045545-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3] dt-bindings: hwmon: adm1272: add analog,temp1-enable binding
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, jdelvare@suse.com
Cc:     belgaied@google.com, jasonling@google.com, linchuyuan@google.com,
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
	Introducing device tree binding analog,temp1-enable. If the
flag is set, flip the temp1_en control bit on probing.

Testing:
make dt_binding_check

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
ChangeLog v1->v2:
 - Rename adm1272-adm1278-temp1-en to analog-temperature1-enable

ChangeLog v2->v3:
 - Rename analog-temperature1-enable analog,temp1-enable

 Documentation/devicetree/bindings/hwmon/adm1275.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
index 1ecd03f3da4d..22ca5a321d5c 100644
--- a/Documentation/devicetree/bindings/hwmon/adm1275.txt
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -15,6 +15,8 @@ Optional properties:
 
 - shunt-resistor-micro-ohms
 	Shunt resistor value in micro-Ohm
+- analog,temp1-enable
+	Enable temperature sampling. This is supported on adm1272 and adm1278
 
 Example:
 
@@ -22,4 +24,5 @@ adm1272@10 {
 	compatible = "adi,adm1272";
 	reg = <0x10>;
 	shunt-resistor-micro-ohms = <500>;
+	analog,temp1-enable;
 };
-- 
2.28.0.rc0.105.gf9edc3c819-goog

