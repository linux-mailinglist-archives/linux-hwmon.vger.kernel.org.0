Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADEA64CA5
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jul 2019 21:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfGJTTC (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 10 Jul 2019 15:19:02 -0400
Received: from mout02.posteo.de ([185.67.36.66]:60355 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727612AbfGJTTC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jul 2019 15:19:02 -0400
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Jul 2019 15:19:00 EDT
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id D62C62400E5
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2019 21:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1562785774; bh=wYxVRF4SaqVlF1JS19uBnqN/QKUJ6G7E8faWhnKw0SA=;
        h=From:Subject:Date:Cc:To:Autocrypt:OpenPGP:From;
        b=jYG4dQVf8vaK5zKIXlb1aS1NPT3TyHlZioq6RlkbmjUwKIo1CqQyKdmq4t0acm0Yq
         qaD0tvZRxITAcTlhcwvG1KBIxQQiqDNYJOktPxK2o9OSZmFTKppeaB6mq/Oa1LCc5H
         5UZ12AHjcPvEaQRI9Vh6YKL/HagEOlW2SuKT41XhcaUUGNY/vnOe6r7KOZFiW4L4hZ
         Cd2VNq7rDv7UQuES+Bpi5I0udnN8Cpa/BWpFwCG3zsoB2DEqxmyXEBqyxabGJi4WYV
         IQJV7AQHTK0WS0RxGijp3T1RBH0OJO6VqpGu3uB+VxNnDRLETuL2BXjetPzlBaVVKR
         yQf4v6Nb0z5RQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 45kTJY6z8bz9rxQ;
        Wed, 10 Jul 2019 21:09:33 +0200 (CEST)
From:   =?utf-8?Q?Bj=C3=B6rn_Gerhart?= <gerhart@posteo.de>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [PATCH] hwmon: (nct6775) Fix register address and added missing
 tolerance
Message-Id: <C4783F82-7655-4997-AE0E-496683FE1C8B@posteo.de>
Date:   Wed, 10 Jul 2019 21:08:56 +0200
Cc:     Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
X-Mailer: Apple Mail (2.3445.104.11)
Autocrypt: addr=gerhart@posteo.de; keydata=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
OpenPGP: url=https://posteo.de/keys/gerhart@posteo.de.asc
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In the process of adding the new model nct6116, two tiny details of the =
nct6106 attracted my attention. Please find the patch therefore below:

Index: nct6775.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- nct6775.c	(revision 16326)
+++ nct6775.c	(working copy)
@@ -866,7 +866,7 @@
 static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] =3D { 0x168, 0x178, =
0x188 };
 static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] =3D { 0x169, 0x179, =
0x189 };
 static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] =3D { 0x16a, 0x17a, =
0x18a };
-static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] =3D { 0x16b, 0x17b, =
0x17c };
+static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] =3D { 0x16b, 0x17b, =
0x18b };
 static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] =3D { 0x16c, 0x17c, =
0x18c };
 static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] =3D { 0x16d, 0x17d, =
0x18d };
=20
@@ -3778,6 +3778,7 @@
 		data->REG_FAN_TIME[0] =3D NCT6106_REG_FAN_STOP_TIME;
 		data->REG_FAN_TIME[1] =3D NCT6106_REG_FAN_STEP_UP_TIME;
 		data->REG_FAN_TIME[2] =3D =
NCT6106_REG_FAN_STEP_DOWN_TIME;
+		data->REG_TOLERANCE_H =3D NCT6106_REG_TOLERANCE_H;
 		data->REG_PWM[0] =3D NCT6106_REG_PWM;
 		data->REG_PWM[1] =3D NCT6106_REG_FAN_START_OUTPUT;
 		data->REG_PWM[2] =3D NCT6106_REG_FAN_STOP_OUTPUT;=
