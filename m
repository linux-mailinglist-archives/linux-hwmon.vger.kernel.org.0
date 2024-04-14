Return-Path: <linux-hwmon+bounces-1700-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7E8A1B78
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Apr 2024 19:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 700FC28094B
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Apr 2024 17:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC32F12AAFC;
	Thu, 11 Apr 2024 16:02:26 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E81292C8
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712851346; cv=none; b=EYwOfYHuiPLV/fAtWa1mvu4r3aTuV/4nVoV3+IeADxhhduDXnLMnPLc/TwwRjgi75CAE+R89CIMeJ1cXVCyMufQ+QMy/h/9I7VRzyUB2GYE30lk+j/uR0Pq+nAUfcOyfQixneurGCdq0nbIUi+1u9lm1SnG5ePr4GEPRbG6SQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712851346; c=relaxed/simple;
	bh=/vF4zARYuqqbDhTcjAm8UsZUNA5qZUsN0fu/StnCQWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s1sGI1AkKUW385n95H1EF/uarqcsj71OFjiRir3e1wLxrswZbWQoHjNHrJ4whzVvxngeQihrbYG2YKQtaCL2/inrdGXEYzm12LfbS/ZMynTlAOKg7VEMgQHjN/Z9y76GDNOktD6igpaVHwwiAxzuvWhKpb+84Ol5Zuym6VwoGNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruwsI-0004zD-Ph; Thu, 11 Apr 2024 18:02:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruwsF-00Bid0-Bp; Thu, 11 Apr 2024 18:02:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruwsF-000gE1-0s;
	Thu, 11 Apr 2024 18:02:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-pwm@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tacho): Drop cpp define only used once
Date: Thu, 11 Apr 2024 18:01:36 +0200
Message-ID: <20240411160136.247138-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/vF4zARYuqqbDhTcjAm8UsZUNA5qZUsN0fu/StnCQWU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmGAlgXwk656AgEYUnUaDxpizHFTADWVOyf8hGP CR3wgvRxq2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhgJYAAKCRCPgPtYfRL+ Ti9UB/0djClWTX8zt9z0cf0OzRiWlLj+0C/40DKe0qcTYTcEWyl8D6prcyKRMOr4dqnB7NlqVBs 6M4bBcwsiGLtl3Ght7jvlhr+ECswtPKKNEw1e0CQYW36hNEmWa/hnXfPedWH5xqBtDSW0su6H2q /Jbwd1y8cd+7cMufUOYUurSN4+ftvdgrCQy+20X0f8xKoTHrvT8Pnt+c/HWLCuycCP1ssKQCFEl Yv+o/+E5ffgPy2hXbU5g2oJZ9gMA10kF+TLojJ9GaGFhZnwa0juodBF6u1ww5nTfI4PaeN7E6iU zsfugocSo4jvBnTVcu0F9lzWF8pQvFLZXNv8HUlt/RONjwR4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

The macro PWM_ASPEED_NR_PWMS is only used once, just use it's value in
this single code line.

Having the number of PWM lines explictly in the call to
devm_pwmchip_alloc() also has the advantage to be easily greppable.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note this patch depends on commit 2c56fedef8c9 (hwmon: (aspeed-g6-pwm-tacho):
Make use of devm_pwmchip_alloc() function) that currently sits in pwm/for-next.

Best regards
Uwe

 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 08a2ded95e45..706c344b181b 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -59,8 +59,6 @@
 #include <linux/reset.h>
 #include <linux/sysfs.h>
 
-/* The channel number of Aspeed pwm controller */
-#define PWM_ASPEED_NR_PWMS			16
 /* PWM Control Register */
 #define PWM_ASPEED_CTRL(ch)			((ch) * 0x10 + 0x00)
 #define PWM_ASPEED_CTRL_LOAD_SEL_RISING_AS_WDT	BIT(19)
@@ -487,7 +485,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	chip = devm_pwmchip_alloc(dev, PWM_ASPEED_NR_PWMS, 0);
+	chip = devm_pwmchip_alloc(dev, 16, 0);
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 
base-commit: 4118d9533ff3a5d16efb476a0d00afceecd92cf5
-- 
2.43.0


