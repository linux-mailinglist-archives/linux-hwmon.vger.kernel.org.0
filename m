Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C2C130780
	for <lists+linux-hwmon@lfdr.de>; Sun,  5 Jan 2020 11:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgAEK6l (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 5 Jan 2020 05:58:41 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45659 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725897AbgAEK6l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 05:58:41 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 5 Jan 2020 12:58:38 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 005AwYmP020934;
        Sun, 5 Jan 2020 12:58:37 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 3/5] hwmon: (pmbus/tps53679) Allow support for Intel IMVP9 specification
Date:   Sun,  5 Jan 2020 10:58:31 +0000
Message-Id: <20200105105833.30196-4-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200105105833.30196-1-vadimp@mellanox.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Allow driver to Intel IMVP9 specification.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/tps53679.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 163e8c6aaa8e..7ce2fca4acde 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -15,6 +15,7 @@
 
 #define TPS53679_PROT_VR12_5MV		0x01 /* VR12.0 mode, 5-mV DAC */
 #define TPS53679_PROT_VR12_5_10MV	0x02 /* VR12.5 mode, 10-mV DAC */
+#define TPS53679_PROT_IMVP9_10MV	0x03 /* IMVP9 mode, 10-mV DAC */
 #define TPS53679_PROT_VR13_10MV		0x04 /* VR13.0 mode, 10-mV DAC */
 #define TPS53679_PROT_IMVP8_5MV		0x05 /* IMVP8 mode, 5-mV DAC */
 #define TPS53679_PROT_VR13_5MV		0x07 /* VR13.0 mode, 5-mV DAC */
@@ -44,6 +45,9 @@ static int tps53679_identify(struct i2c_client *client,
 		case TPS53679_PROT_IMVP8_5MV:
 			info->vrm_version[i] = vr12;
 			break;
+		case TPS53679_PROT_IMVP9_10MV:
+			info->vrm_version[i] = imvp9;
+			break;
 		default:
 			return -EINVAL;
 		}
-- 
2.11.0

