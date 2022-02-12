Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527274B3510
	for <lists+linux-hwmon@lfdr.de>; Sat, 12 Feb 2022 13:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235101AbiBLM53 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 12 Feb 2022 07:57:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235097AbiBLM50 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Feb 2022 07:57:26 -0500
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0A92657A
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Feb 2022 04:57:22 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 29251 invoked from network); 12 Feb 2022 13:57:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1644670640; bh=Hnc+Qdesfn7FUkkcgRMr4KZpAlSMn5aE+vkE9mocejA=;
          h=From:To:Cc:Subject;
          b=Z8Q/Kt/YF4VuS14b/kC1g44cW8Ofdo8diPajVufzEgLdKTbE6/mipKHP39j8AbL2P
           g8hWmTMFTmK+fIGYELdEi88Pyol/dWX12IrHXSMG5zly+BjkP3f7VTrh+MQRu33a6q
           chfq05jKQCTi+1nGmI2Lhfwss+DBRS4wwPCLNK4Q=
Received: from aaem217.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.116.217])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 12 Feb 2022 13:57:20 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 2/2] dell-smm-hwmon: rewrite CONFIG_I8K description
Date:   Sat, 12 Feb 2022 13:56:54 +0100
Message-Id: <20220212125654.357408-2-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212125654.357408-1-mat.jonczyk@o2.pl>
References: <20220212125654.357408-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: df653e025b1fcc69e7e35d166c0b1581
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [AXM0]                               
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It is not the laptops, but the /proc/i8k interface that is legacy (or so
I think was the intention of the help text author). The old description
was confusing, fix this.

The phrase "Say Y if you intend to run this kernel on old Dell laptops
or want to use userspace package i8kutils." was introduced in 2015, in
commit 039ae58503f3 ("hwmon: Allow to compile dell-smm-hwmon driver without /proc/i8k")

I think that "old laptops" was about hotkey and Fn key support - this
driver in the 2.4 kernels' era apparently had these capabilities
(see: https://github.com/vitorafsr/i8kutils , description of
"repeat_rate" kernel module parameter).

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Pali Rohár <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Gross <markgross@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

---
v2:
  - help text language fixes (thanks: Randy Dunlap),
  - modify commit description.
---
 drivers/hwmon/Kconfig | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 1ee4e5eff567..39aeecc72800 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -506,19 +506,18 @@ config SENSORS_DELL_SMM
 	  userspace interface for i8kutils package.
 
 config I8K
-	bool "Dell i8k legacy laptop support"
+	bool "Legacy /proc/i8k interface of Dell laptop SMM BIOS hwmon driver"
 	depends on SENSORS_DELL_SMM
 	depends on PROC_FS
 	help
-	  This option enables legacy /proc/i8k userspace interface in hwmon
-	  dell-smm-hwmon driver. Character file /proc/i8k reports bios version,
-	  temperature and allows controlling fan speeds of Dell laptops via
-	  System Management Mode. For old Dell laptops (like Dell Inspiron 8000)
-	  it reports also power and hotkey status. For fan speed control is
-	  needed userspace package i8kutils.
+	  This option enables the legacy /proc/i8k userspace interface of the
+	  dell-smm-hwmon driver. The character file /proc/i8k exposes the BIOS
+	  version, temperatures and allows control of fan speeds of some Dell
+	  laptops. Sometimes it also reports power and hotkey status.
 
-	  Say Y if you intend to run this kernel on old Dell laptops or want to
-	  use userspace package i8kutils.
+	  This interface is required to run programs from the i8kutils package.
+
+	  Say Y if you intend to run userspace programs that use this interface.
 	  Say N otherwise.
 
 config SENSORS_DA9052_ADC
-- 
2.25.1

