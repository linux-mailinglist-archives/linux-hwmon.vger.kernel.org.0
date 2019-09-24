Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1099ABD0E7
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Sep 2019 19:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407577AbfIXRrd (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 24 Sep 2019 13:47:33 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:56885 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404360AbfIXRrd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Sep 2019 13:47:33 -0400
Received: by mail-qt1-f202.google.com with SMTP id m6so2796112qtk.23
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Sep 2019 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=DBG/wFyung5W8UWO8gFujad4LCgDfce9k3vKq6AZOHc=;
        b=seXQRnG46I6Ci9HSw67oM4f9WU5RkjmQX2F1eTZvaF10NZJKm/ILV0ZrtVikdF+Sl/
         sgcA8DGRARP+NC27ixqtahqQ0TrX25UIlrcGpQs+2UU0fZx/OfPejIjIWx60N/VQw8pA
         e6XQMVBYmrhl/IdQnJ/tnYp0/5QdvCbanCSHTfeiKlV8eqmTujwDoJyjjFzHm1blLi+t
         msRPBmg70+21BGQqQWSLUWVo2HCcjgEJGsFkj9eqJZAFg95KvDAUA/DbgOzTiEpwFmr8
         q378DkEh/bKx4RYUt6EgDvf68S88RRjlndPnuornArPd7L1ZTGixqCCQwb94iO4mGkve
         hfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=DBG/wFyung5W8UWO8gFujad4LCgDfce9k3vKq6AZOHc=;
        b=r6+PEDayatADqir2tZKK2HS8E9jHYiNLeNLBXgMXrHrnEdn5NDTzKwpV8Ios8doK/i
         ic778HKEvtOGtyQ3jn98j/8oGxdQQtb5YaTAzpKevoeACZun947SEDU6SlQ8NIUdDm2S
         IntmDw8E1dPZXUzPPzK1BNTPiJpQdGDjCCxCK83Zr7KNl+XDrlMtx+BAjfa80CNXm1I3
         uIXBwA1jnZYgdSf4CD428e9aIcy/hSltuJF8gWdz8PeF7mhDjICe9SspwP9JzhxFO9Uj
         R6nlk1C3Goey5XUm9VuP+DDyZpSBFIfAqbw3olr2XTeQu7m8dRJFFEjdellEQ+t7hbbn
         EIig==
X-Gm-Message-State: APjAAAVRBFlLuojyAfDIi8WKTm5y6TLYxF3l2TlXvVhRVpDTSqHLAK5Q
        POGED+H7d7fmMdm+s2jFx3SsfyU2i8qi4yNKrDY=
X-Google-Smtp-Source: APXvYqxqiZGW0UgAYDRxKRJCktP8tpY/Jew2d6NDW6FIJf4VUr2P6v9BiY4203WhfvWsdVfDNVdf5kMzk37Yk2qyDcc=
X-Received: by 2002:ae9:f404:: with SMTP id y4mr3717758qkl.225.1569347252597;
 Tue, 24 Sep 2019 10:47:32 -0700 (PDT)
Date:   Tue, 24 Sep 2019 10:47:28 -0700
In-Reply-To: <CAKwvOd=GVdHhsdHOMpuhEKkWMssW37keqX5c59+6fiEgLs+Q1g@mail.gmail.com>
Message-Id: <20190924174728.201464-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAKwvOd=GVdHhsdHOMpuhEKkWMssW37keqX5c59+6fiEgLs+Q1g@mail.gmail.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v2] hwmon: (applesmc) fix UB and udelay overflow
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     linux@roeck-us.net
Cc:     clang-built-linux@googlegroups.com, jdelvare@suse.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        "=?UTF-8?q?Tomasz=20Pawe=C5=82=20Gajc?=" <tpgxyz@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fixes the following 2 issues in the driver:
1. Left shifting a signed integer is undefined behavior. Unsigned
   integral types should be used for bitwise operations.
2. The delay scales from 0x0010 to 0x20000 by powers of 2, but udelay
   will result in a linkage failure when given a constant that's greater
   than 20000 (0x4E20). Agressive loop unrolling can fully unroll the
   loop, resulting in later iterations overflowing the call to udelay.

2 is fixed via splitting the loop in two, iterating the first up to the
point where udelay would overflow, then switching to mdelay, as
suggested in Documentation/timers/timers-howto.rst.

Reported-by: Tomasz Pawe=C5=82 Gajc <tpgxyz@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/678
Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* The first loop in send_byte() needs to break out on the same condition
  now. Technically, the loop condition could even be removed. The diff
  looks funny because of the duplicated logic between existing and newly
  added for loops.

 drivers/hwmon/applesmc.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 183ff3d25129..c76adb504dff 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -46,6 +46,7 @@
 #define APPLESMC_MIN_WAIT	0x0010
 #define APPLESMC_RETRY_WAIT	0x0100
 #define APPLESMC_MAX_WAIT	0x20000
+#define APPLESMC_UDELAY_MAX	20000
=20
 #define APPLESMC_READ_CMD	0x10
 #define APPLESMC_WRITE_CMD	0x11
@@ -157,14 +158,23 @@ static struct workqueue_struct *applesmc_led_wq;
 static int wait_read(void)
 {
 	u8 status;
-	int us;
-	for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_MAX_WAIT; us <<=3D 1) {
+	unsigned int us;
+
+	for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_UDELAY_MAX; us <<=3D 1) {
 		udelay(us);
 		status =3D inb(APPLESMC_CMD_PORT);
 		/* read: wait for smc to settle */
 		if (status & 0x01)
 			return 0;
 	}
+	/* switch to mdelay for longer sleeps */
+	for (; us < APPLESMC_MAX_WAIT; us <<=3D 1) {
+		mdelay(us);
+		status =3D inb(APPLESMC_CMD_PORT);
+		/* read: wait for smc to settle */
+		if (status & 0x01)
+			return 0;
+	}
=20
 	pr_warn("wait_read() fail: 0x%02x\n", status);
 	return -EIO;
@@ -177,10 +187,10 @@ static int wait_read(void)
 static int send_byte(u8 cmd, u16 port)
 {
 	u8 status;
-	int us;
+	unsigned int us;
=20
 	outb(cmd, port);
-	for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_MAX_WAIT; us <<=3D 1) {
+	for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_UDELAY_MAX; us <<=3D 1) {
 		udelay(us);
 		status =3D inb(APPLESMC_CMD_PORT);
 		/* write: wait for smc to settle */
@@ -190,6 +200,23 @@ static int send_byte(u8 cmd, u16 port)
 		if (status & 0x04)
 			return 0;
 		/* timeout: give up */
+		if (us << 1 =3D=3D APPLESMC_UDELAY_MAX)
+			break;
+		/* busy: long wait and resend */
+		udelay(APPLESMC_RETRY_WAIT);
+		outb(cmd, port);
+	}
+	/* switch to mdelay for longer sleeps */
+	for (; us < APPLESMC_MAX_WAIT; us <<=3D 1) {
+		mdelay(us);
+		status =3D inb(APPLESMC_CMD_PORT);
+		/* write: wait for smc to settle */
+		if (status & 0x02)
+			continue;
+		/* ready: cmd accepted, return */
+		if (status & 0x04)
+			return 0;
+		/* timeout: give up */
 		if (us << 1 =3D=3D APPLESMC_MAX_WAIT)
 			break;
 		/* busy: long wait and resend */
--=20
2.23.0.351.gc4317032e6-goog

