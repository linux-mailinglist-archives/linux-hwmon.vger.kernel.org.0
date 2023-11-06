Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BC67E1A69
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Nov 2023 07:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjKFGok (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 6 Nov 2023 01:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjKFGod (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Nov 2023 01:44:33 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542A8F9;
        Sun,  5 Nov 2023 22:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699253042; x=1699857842; i=w_armin@gmx.de;
        bh=yby7QfP6v7gwS0o8J0rP+60CpZOmUkz59NSuTBr0O7I=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
         References;
        b=VcVsK7CTXjrUd20CmwYXgAqba+LmPfcp48I0v0CgfC7kS4ZqqbekC+wq/ZQN2LN/
         fJFQqCZbV3OLE2curJ7/m+KnNw2sE9EOxuL1YqotI/oWKYsrKa7EnoxRk8AnD8BzK
         Jbj2N8iSJDKVlxBkQFMjSp+qSHZVQoKUmP2YjAPuaqV+loJopork8qklQaQafwD1g
         J6knqbmCWObM6NoddlCGvHFiF/WpYfi41y9adPNEqrT5ecK1tTVsYe18VTP1A+lXK
         TKkUYdO03Opd9SlC68Ku167K+zoyKaHW0GKBaPlbCIAzQtCG2bbbwlsVRSRmHptO0
         6MDX2N3Q+X/KNP9i6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mo6v3-1rkofJ00Vv-00pdA0; Mon, 06 Nov 2023 07:44:02 +0100
From:   Armin Wolf <W_Armin@gmx.de>
To:     pali@kernel.org
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] hwmon: (dell-smm) Move DMI config handling to module init
Date:   Mon,  6 Nov 2023 07:43:46 +0100
Message-Id: <20231106064351.42347-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106064351.42347-1-W_Armin@gmx.de>
References: <20231106064351.42347-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jYy8yrQCFAJJ+MwxFNFDaqiPjMiZhoLMtQ832kOa2IgoT3QG7JL
 1kBSbISPgx18l2RljGJ7ZzoY3C9490wQ7n15xggCe20hU2V02WFDQHK0jkNuxxJaYERCv8U
 fNC4Y8VcVZSorgodS6kKgfGWdeMYXJInrrNnfz/DerK3jlqP7FY8K4Bo+PiFKcCokN47rve
 fxZMYmkUpl420f+6oCqEA==
UI-OutboundReport: notjunk:1;M01:P0:Bi/5eh/e2MQ=;uSJntCld7Ow3g6Atsixo9ZdKGeg
 rHEsll0VXnEIIXaDAzNfYau9e6eZmQ05XHWjdJ2ujCoGMMrI1xKf5sXXG7t/GP75FNsNDWWbC
 j7SGbkKFCrcArSTQ47+r2Rl9+vFxD676zOmUwJBkbL/JDrLB/Bzl1URIvaZ4RNp8Ey4+Xu4yg
 m9pcYyqYXnTiSr/yhXYW4wonGgsysVoSNotqWQIaWGrzg4NJM7blmN8ikvZPCPrDLlyWd4Pqv
 Ro5BCzkH8RRQswjCiWKKddYqiYcAGlWC0OfViSYeTjTO/l5XcnGNIK6XyFAKYKZcYmm6hy9d1
 3NcrO+atR3KemYqnaew4j6nrcGknpzB+kSdOdCDZ+Pl6uJc2PGSret1A2Ia7SvQPJQiLhT3F1
 FUZ5SOQvisyzP+Qaqd6CI94ffWfXtuxSoiCAJMCzUb+z+YgjPKbR8NlgQgcKh/o8dW7sD7fTP
 JG5pPqTas/gWvidXUx7SY+3vILuxnl1KdJk5lvTUF4QKyqaUYN4HFDxQwCdUlpH2z9bk1f6s8
 kpU/lLRnvRmQUoCCgCDHPCrnnh8AtOLlUTKGwApQb92Ho1q2lE9o9WEItCT4B4MB1EZQSN9oD
 zXqzn6ZTQq5tFyOPhKjkVyKbydEL6RBwE4PxQ2O8VeaEkq8U7oculzsuikeYkwp68+EdouJex
 7E89rfbRevylhxnxGRji0R2WnF+5a1YVuAtpHk8aR/vxRyI08nc8Lgw9JOYLlj/GI6iM/XPKa
 lhlS1Q8xB7OY90d+cy6Nkhla74rxsU/RmtTi8OE7Ff3zfvmr+4DJtsH2KI46mrEJU4F9vf4no
 hBrOakz44uzqsFC8ZN+rhmVs1eh+4NIWk32rqxuBXwgXdbxqNJW7bA26zS3ud/zWx/aLiCVaa
 qlvbxI5fSXaOszTdV/OzWaW1GdZEy/oab9KC3bv826TjkW9qEqA6AIRZAeD+I10x5j2qcuIHU
 6PJwJrzXp13Wii6GIN+u27oCZL4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Future SMM calling backends will not be able to probe during
module init, meaning the DMI tables holding config data would
have to drop their __initconst attribute.
Prevent this by moving the config handling to module init.

Tested-by: <serverror@serverror.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 3a792faf2369..3d14a3baf8e4 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1370,7 +1370,6 @@ static const struct dmi_system_id i8k_whitelist_fan_=
control[] __initconst =3D {
 static int __init dell_smm_probe(struct platform_device *pdev)
 {
 	struct dell_smm_data *data;
-	const struct dmi_system_id *id;
 	int ret;

 	data =3D devm_kzalloc(&pdev->dev, sizeof(struct dell_smm_data), GFP_KERN=
EL);
@@ -1386,21 +1385,6 @@ static int __init dell_smm_probe(struct platform_de=
vice *pdev)
 	strscpy(data->bios_machineid, i8k_get_dmi_data(DMI_PRODUCT_SERIAL),
 		sizeof(data->bios_machineid));

-	/*
-	 * Set fan multiplier and maximal fan speed from dmi config
-	 * Values specified in module parameters override values from dmi
-	 */
-	id =3D dmi_first_match(i8k_dmi_table);
-	if (id && id->driver_data) {
-		const struct i8k_config_data *conf =3D id->driver_data;
-
-		if (!fan_mult && conf->fan_mult)
-			fan_mult =3D conf->fan_mult;
-
-		if (!fan_max && conf->fan_max)
-			fan_max =3D conf->fan_max;
-	}
-
 	/* All options must not be 0 */
 	data->i8k_fan_mult =3D fan_mult ? : I8K_FAN_MULT;
 	data->i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;
@@ -1429,6 +1413,7 @@ static struct platform_device *dell_smm_device;
 static void __init dell_smm_init_dmi(void)
 {
 	struct i8k_fan_control_data *control;
+	struct i8k_config_data *config;
 	const struct dmi_system_id *id;

 	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
@@ -1449,6 +1434,20 @@ static void __init dell_smm_init_dmi(void)
 		}
 	}

+	/*
+	 * Set fan multiplier and maximal fan speed from DMI config.
+	 * Values specified in module parameters override values from DMI.
+	 */
+	id =3D dmi_first_match(i8k_dmi_table);
+	if (id && id->driver_data) {
+		config =3D id->driver_data;
+		if (!fan_mult && config->fan_mult)
+			fan_mult =3D config->fan_mult;
+
+		if (!fan_max && config->fan_max)
+			fan_max =3D config->fan_max;
+	}
+
 	id =3D dmi_first_match(i8k_whitelist_fan_control);
 	if (id && id->driver_data) {
 		control =3D id->driver_data;
=2D-
2.39.2

