Return-Path: <linux-hwmon+bounces-152-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE9E7F3C49
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Nov 2023 04:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9371C20EE8
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Nov 2023 03:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA596747E;
	Wed, 22 Nov 2023 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="qcH4hEee"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062.outbound.protection.outlook.com [40.107.255.62])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D6B197;
	Tue, 21 Nov 2023 19:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtscoswv/BxhDv2X/y3oEpIdbJm4LvZw0ps3u0vWG38xpOpNoiHKJahYZm/nlffbE84xR4dof+JMSGJ5+rG0BPAHjwgnXRPVAaG/8tSzDc8ywDhd+ZEtuta9mFC5o9VHtj7/px4U3w9uQOaTsGTvjX3veQJEiBKRSjSiZ7SAkz5qVo+s0vuhjJLuqX+7kjj7o8hB3kZS05taSzAt87SWApUyvSllRF1YnLtjpjSq8EMSHngUo5BtXWACEzgJ5A//8jf95gfZEltn9+URFRlXaaHy/UpHagik+MmUTx7AVXfYoOsQ2/i7Sdr+ZfqQHX1VuqsxfWUSwxy8TqP/19Xs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DV+AT0j7zdkc5daB1loqGuFLWJsc9iguLBX/Ldd0yQ8=;
 b=i3HB1g8059Q3Eh3st7J5Y7fOc/wKMpyrH0AVI+WB+52m5lg4V5TNVvDBKJdYiEeFjxlXD0nUFhVkx6bEgq2d54rFvkenNDlhfKGcKz7L3rN0npzumPI3JGFDtVoMu6REL5foI25mR2587cs9jEOjiQzDZLfEyYDKbj8VQB3U5cdDCZ6RlkXimihBlAL6nD3SUdyw5wH89qso/UBH06h/XtlOnGHdKrWAOM6+9Wn+Be3LSTy5ESZhFlzhdhmXAc07kysno1/RxRR+JuUAiz5X6/iqodWVIzXL6USbqyUh/FCRO4k+pQCrjjrXIQIATvlbItRTDfzuHY7fnS3V6aa1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DV+AT0j7zdkc5daB1loqGuFLWJsc9iguLBX/Ldd0yQ8=;
 b=qcH4hEeeOgOFd69xHY+6ldkCAuZCtvLxfW0qPAEOZBcQm0vbd/WGl0u4V5zoljcMJ8bD+EbGm97J2JFrQuRRisG16oIhIlvxD1PCD/+fxOpMBeHkyMa0dGdAwvIPm7Qy1IfKEiGHSyuh4xOad4CjIP/MQh+HNYcv4yXY+i5oa5s5kbCLwJQX86eaXHn+cUS15T+JPx3NrmL3LnVzXcIYlWn/ZRvF50s0WOAclcK6+y/dfVsULNobR9oPBdrVW0AwGTtbZEkqWUeKKsWBfYElvKMgijhGzxR4OAOaJOEbfTiyyeh9wKw0+d0Js2nKKzxbDW3ljhSriFZYfMsE8HQOGQ==
Received: from KL1PR02CA0035.apcprd02.prod.outlook.com (2603:1096:820:d::22)
 by SEZPR04MB5778.apcprd04.prod.outlook.com (2603:1096:101:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 03:23:47 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:820:d:cafe::71) by KL1PR02CA0035.outlook.office365.com
 (2603:1096:820:d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 03:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 03:23:45
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 0/2] Add adm1281 support
Date: Wed, 22 Nov 2023 11:23:40 +0800
Message-Id: <20231122032343.2794903-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SEZPR04MB5778:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c568bf1f-e362-479a-9040-08dbeb0a6fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LW44VxbMvpFpG0c5PuBjW9/nvDZ3uw2tcc7/1cQMCz+GXZ/dvMpHbH/YFedIYa2cSMGZdbBlnzWbk8lhwkKYirSFwTPoZrzH4df0j0VLGHgGgH1BMkNM1zTX6OPXpeF0RuoX34iqM1UTXE5hcP6zQ1eoWyj+3Sk14Dn+WqQU2AiicJ5Z8gGiQJbZjNouN0AAEHVkoHQIZME3PuWZFHbOJ7ubqAZVzMzUQGDntA074AZ+vOJ1gnL71nxJbjDZn9s1hA+XEP4sk1y+QTPMMnWm3MLitkYL3wFJTSSumHXysU+zPzq16dFZ2iE2cjqfxM2DA5OHnX3E2lIF2wsG1GPv2IrjrPfLMPgNucJTa4AHJ+AN6F8NhUaIpMsV5N0hpIpMSbk3XUAFbSI/nF7huJiFK3aIN+SzoMdWqzYSkHthbxP1l96mJX6xzWT1yGNNbIOcvqlN7D15imn/ugJpLe8QJ9gFfnXM5nR3rFIpI2dw2By9K4DVb9UK5ah/l+izhF6NhByA7dZffsqsENSC0ENG+d06i+FpThnQSgScU3+taVKCV+svZsP2KPJB5Bq61Js5n5IXkb/mQr5jY3Frn2dNdfI0fUw0pw5NW6iJuMSY0+EsXycvV+9F4/2tRhbFrgbB5F83jVmn+UE8LHDimj5lJEMhm9jyXVseSFloV3oLD61P7eVwdvL1wdA+4iNnfMyx6kxAgw/sBWTTkjZFea29mg==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(82310400011)(1800799012)(64100799003)(186009)(36840700001)(46966006)(36756003)(4744005)(5660300002)(7416002)(86362001)(41300700001)(2906002)(2616005)(9316004)(6506007)(6512007)(82740400003)(956004)(83380400001)(1076003)(336012)(26005)(6486002)(478600001)(6666004)(70586007)(47076005)(36860700001)(81166007)(356005)(316002)(6916009)(54906003)(36736006)(40480700001)(70206006)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 03:23:45.5178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c568bf1f-e362-479a-9040-08dbeb0a6fab
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5778

v1 - Add adm1281 binding document and driver support

Delphine CC Chiu (2):
  hwmon: pmbus: Add adm1281 support
  dt-bindings: hwmon: pmbus: Add adm1281 support

 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 2 ++
 Documentation/hwmon/adm1275.rst                          | 8 ++++++++
 drivers/hwmon/pmbus/adm1275.c                            | 8 ++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.25.1


