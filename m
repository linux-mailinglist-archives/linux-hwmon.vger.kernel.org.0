Return-Path: <linux-hwmon+bounces-154-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC47F3C52
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Nov 2023 04:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E023D1C210A9
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Nov 2023 03:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5FF849C;
	Wed, 22 Nov 2023 03:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="aDHAZfRE"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2040.outbound.protection.outlook.com [40.107.117.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4CAD54;
	Tue, 21 Nov 2023 19:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxuh9/ij6ocLA3XoJPgUcS2oQKc2KFZUhlUz1gZ7ZkrbOCDnVBfsceBBInuKWu6hroPTS64rLZEi2+5a/1GqQvB7fsnz85EmsWtJQwHqV44VCPwa0dJ5v375DVxiQC5/aggKI65J4UKyVj431ghdmBztTRaZelthq/A1BhItoo12wUwLWbwUHt5C7f1por00gG4+ziqreJtLlVTu/pixO3sflDhAaedPr1oRcOOTUNczPPVQVqK+lWkW4gPPplxNVFud0NybEFzSs7zgImW/4wWxaswkbXhZPovnf3317r02tLf0EwDbEeBwyGg41EkrG+L67wLBI2kCE2sTajBVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TAu505xZka5iEu4GuNbqK8LkJE7k/YWH1R52hNBm6A=;
 b=ghGRaUXvrsimk/DPp6t3h7vwf7jiGJBNxdkusQtYlKYG2yVjy+LRmoU1spw6kebBIOOXBhfAuYEJ+S4Pef4BE1kox6H/I5/CQnxpuQHy+mM8Zdo8PrbUBW3P9jHDeksV0VLw5nvozu4xcP/V57Gl110tJImwE99qOMqHW83Zc1WcF43ivkTCWY+kLH2kfwxTjneegkPNO3tPZpXGc7y+rJOrIGxEJHxIAHtSuU+JqsXpGWf1vvfv1PGr1CMhp0xR7I1FiEObkhbldAmTR4KY6BcbGKuRTYRWqElOMx+XBUg786YP8o/g1H3i2E6/ONdR4YkQR5Tb5PU8uMWSL0KcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TAu505xZka5iEu4GuNbqK8LkJE7k/YWH1R52hNBm6A=;
 b=aDHAZfREfqTgoxYzcNhGodHwtQtAKelHUWR8fM4V/WENyoMP2j83UWNJ74ozZNpTJ/tFEAtydR8bzzdTRGacUqeOXcIEP3oC9VCcCG5W9mwaTXtEpn/vrQOF7DsgMjKLDN5qGHxeONbzUADypAzItvSew9558SkNSrOLYMrELVWWc/1PCx4XTk4kAxJgczYBSoipz5peCmDq1tivUboEvCpp1Z1BA1Tbbli/Dv32uLr9f+3FyRfpzn+DVj0W8UeupHQ9vx+8XlKCbk61aaHKH3B15Yrrq2rz+sZdqVQQF5zN/BARkm1KWjH0xXTfgPYxufuY+6zSFtPQNSMgeiPhEQ==
Received: from KL1PR02CA0034.apcprd02.prod.outlook.com (2603:1096:820:d::21)
 by PSBPR04MB3973.apcprd04.prod.outlook.com (2603:1096:301:c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 03:23:51 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:820:d:cafe::bc) by KL1PR02CA0034.outlook.office365.com
 (2603:1096:820:d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 03:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 03:23:49
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 1/2] hwmon: pmbus: Add adm1281 support
Date: Wed, 22 Nov 2023 11:23:41 +0800
Message-Id: <20231122032343.2794903-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122032343.2794903-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231122032343.2794903-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|PSBPR04MB3973:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd946953-9681-41c9-2380-08dbeb0a7247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3lRnLSST4DQvBD+MP6Fluto1BYDQkDR7vNBfeLJ9zCrVEDduI6K/HWhfjQ+3W/YeWQVcdXkj/FyQtRsqxkl964DHpNrjSMjPBC63Sysgpq+PM94mm6Ci3eyvIBKTY1RoD2VcG74nVp4xxxYVAchdibyAKBQ+1+srzgfSXgWS3lNbjhZvroRFnwulfsnmwVZKcAdYiiH4BsVoebgpVLebhmNfeZOy+cZI80FBbhBONAzNBgo6nogMnLfH/mRWaPCRJaaKM3CLq1LfzDXfRLidCnQZdv8Ar6iexwWiruyalFt6po7gkmWEOr9MolPeVSA57+AH2h1XDo15ePvstNLxf+z76QO/BVw68Py2yOvAKB865EEge24g8Ef9f2QDHxzqOVAXUgknlfzOdsFHjPEtidDKtwBNIju4eSj4Ccg85W9V/6Ee/G+RGDlNlRqFITW/56Hde6pkEWEPWFXZygxoDroQo5HoK2w1XMrOrSHXS3ivKlJeWzNRxx6OlYsydJ8NL31O7hQHxgptvQM2iAYBcSilt+LZLI27hE/DHomQB83gfhLnh/fr4eAenkRVf0DvwVdu37r1MNa6Pg+pRxRx3PqOTVkrwS84VQvMMrnTQTuV2wg2LWi4S2di3Fbt27vSWCiZb9SyBrqHolAsioP1WaqORosa92MqUOqMPsQQyV02Q3UcDY2/oWnNpCD/mztsAZdPY7U3+ekVGm4T9/nyPA==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(36840700001)(46966006)(5660300002)(7416002)(2906002)(4326008)(41300700001)(8936002)(8676002)(110136005)(70586007)(316002)(54906003)(70206006)(36736006)(6666004)(478600001)(6486002)(26005)(6506007)(6512007)(1076003)(2616005)(40480700001)(956004)(36756003)(83380400001)(336012)(9316004)(15974865002)(86362001)(82740400003)(47076005)(81166007)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 03:23:49.9084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd946953-9681-41c9-2380-08dbeb0a7247
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB3973

Add device type support for adm1281

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/hwmon/adm1275.rst | 8 ++++++++
 drivers/hwmon/pmbus/adm1275.c   | 8 ++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
index 804590eeabdc..47a13b56e086 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
 
+  * Analog Devices ADM1281
+
+    Prefix: 'adm1281'
+
+    Addresses scanned: -
+
+    Datasheet:
+
   * Analog Devices ADM1293/ADM1294
 
     Prefix: 'adm1293', 'adm1294'
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e2c61d6fa521..979474ba6bd3 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -362,6 +362,7 @@ static int adm1275_read_word_data(struct i2c_client *client, int page,
 		ret = -ENODATA;
 		break;
 	}
+
 	return ret;
 }
 
@@ -482,6 +483,7 @@ static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
+	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ }
@@ -555,7 +557,8 @@ static int adm1275_probe(struct i2c_client *client)
 			   client->name, mid->name);
 
 	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
+	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
+	    mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -703,6 +706,7 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1278:
+	case adm1281:
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.25.1


