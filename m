Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398D818C33D
	for <lists+linux-hwmon@lfdr.de>; Thu, 19 Mar 2020 23:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgCSWsc (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 19 Mar 2020 18:48:32 -0400
Received: from mail-pj1-f73.google.com ([209.85.216.73]:44945 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgCSWsa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Mar 2020 18:48:30 -0400
Received: by mail-pj1-f73.google.com with SMTP id t7so2593878pjb.9
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2020 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LhMQ+INauU/9KsdnAD4j2Pb0cvx1ECfEdZDOsAn7Tjs=;
        b=MhM+didPcgg860ORFtZLYW+f0Yigz9R3V9Dt9sQFenpw5C8t+d3zAp4iZdnHS20qBj
         rluUdvf3Tk5HZ+fhAi+3AhaWvz6M+8nPWu3gEjKl+mlO13h6gzwlEWXL/mUVBeRs2Q1Z
         BXnLAIZ4oYQYPE6viTR1RxUYphilXx+en4IHpEXGMygvfUa40O3kVU0Oxj2sc6V1ACiT
         3eQOHS+rfuemcp3ctkZ5yzASfOo/QIp4jzErU+6nwvqG/FjdsT3YbnG4foi4eG0755xh
         aBIwiN7e8pqaY440bLfaY470kt6vhy+0vhGsbDWheRHYTqa9t2oI6lP7JabCSxg+rBng
         2tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LhMQ+INauU/9KsdnAD4j2Pb0cvx1ECfEdZDOsAn7Tjs=;
        b=KW0pSooNrlokCVmPrKFg77nG9NNdGPCYvkfG9k2jJLxTAZJIxqyUyRvLaGqMnJqUIp
         BjpuDAZNF1pOXjSI5uTaQiUmNaRuKZMMsW7IeVZLrrqJbukwgXUFLHd6j/K3B2+5fiJr
         C6yuzB4IOwNeHveaqcTIv71KYAHn38yI82KOXaqxncb0vd043J7RWCCmKmhr03yY7WJ6
         pEZ2FpzSCPhS6MIvCiVLo2O/gMkaFmScPDNhb7AGJpCcBvhHOExaeoOrxT2/wj+n+NnE
         TnkVW2hm/d9Er5MoYGXaRFhzhgqvaf5zrWbjbfgGut/B+2zQ7Td3hCU/gX5EzCt+q+bn
         MWqw==
X-Gm-Message-State: ANhLgQ1jS90/SzgtsPRjOpGLCkxmuNN4oKP/IE1+x+n6OdYxHXXftW7U
        cK2h5KUp8DkvU0N7eB9iaySkyROAbQ==
X-Google-Smtp-Source: ADFU+vsLgunwRk9yZ3AUlPSafEADszzRYkrqieYJNQ1jOtHdB0maXLeE+UQJmDtZWigVEJCVaugEtLcuxQ==
X-Received: by 2002:a17:90a:25c8:: with SMTP id k66mr6241638pje.90.1584658108071;
 Thu, 19 Mar 2020 15:48:28 -0700 (PDT)
Date:   Thu, 19 Mar 2020 15:48:11 -0700
In-Reply-To: <20200319224812.202013-1-kunyi@google.com>
Message-Id: <20200319224812.202013-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200319224812.202013-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v1 2/3] hwmon: (sbtsi) Add documentation
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/sbtsi_temp.rst | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..f5addb72d13f
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,33 @@
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
2.25.1.696.g5e7596f4ac-goog

