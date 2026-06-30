Return-Path: <linux-hwmon+bounces-15455-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3j76K24uQ2rlTgoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15455-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 04:48:14 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 293906DFDCD
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 04:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b="Nqux/76W";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15455-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15455-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49FCA3042436
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 02:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEA23C3BFC;
	Tue, 30 Jun 2026 02:47:33 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B399D3C345C;
	Tue, 30 Jun 2026 02:47:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787652; cv=none; b=bH8vtQX2rW9k7QEa/c9DVmQbavPdt8kho6+UWvyF4AvZCHznp51bPiWJOugQQHXouXfwMsFb0ZspZ4M2aH5oSZguAFscorob0YTuVE02qkzqYx5XiZUiD8skILLin0Dyz7MXcy1vGc8YydjuRSJdB4fIYfZdBPOWh25rjAdIE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787652; c=relaxed/simple;
	bh=oalIXLUxx3HUFug10a2w3a72SFZcLM5VnDew1JnNkgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TanBv4eSwAzjfEM1bH3W/N9fLylSBFWVP3RCjnU3H+T/gnM1uQaX0wcPF9i3bZJZpiU1zgBDrUnaHsftNHPD1UdT7D+bL9eHZAB+nknhxNdu9/gd1VnyMs1BdMuK4qH/vSgSMgfqs75dRXLLIPWLCWqgBn34wigADtHZDdZMCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Nqux/76W; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GJtm3578895;
	Mon, 29 Jun 2026 22:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=UbYpY
	4JMFFt84GipfIStNVeKLhUSbQPuw9UOMK3fAYY=; b=Nqux/76WbDC6Xj0USTabz
	GnSBdBN0U1CTlJuwwgnndnQvqX+SocLtuX20zZrKRtvyOC3kNHgDVdB5L3N8Phka
	I+mvSLEuJA7RAQVzVRto+TW444XAzApdzebjxZSfMAlNT9ioHAA2JPslklV9DYWg
	4I8rzb/vM1ofwCKGmwcynvJebEabllHsrbpAjyO/Ug9dZgjBRg3fshg7tAud/guC
	pTwl58h3IsOzdpiw7LjflL50jztgCcQkWiYTNZeAnX2eXpcDVB+hKfwjghwGR/F5
	Bj78bG4WcHTSih6ZNBHJWzwZy67uWD/a7GqWUXc1hYy+K6dJPK2oiKDIARXoKoH/
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f3sav311b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:17 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2lG3Y032994
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:16 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 29 Jun
 2026 22:47:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:16 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhf019448;
	Mon, 29 Jun 2026 22:47:07 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 30 Jun 2026 10:46:44 +0800
Subject: [PATCH 2/6] hwmon: (pmbus/max20830): add support for enable GPIO
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
In-Reply-To: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=1322;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=oalIXLUxx3HUFug10a2w3a72SFZcLM5VnDew1JnNkgc=;
 b=pf/AVOjkUIVMwvS5n6bSjuJaqDhJTwrQZdaHqNeGufQmTWunjcQOZcPMWF3plEIU6tRwftIa1
 0YaskWW3XrPBg248lJnw6GxPZroRhaY/tXtmeqneko7Csrx3yCQeyo0
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=avWCzyZV c=1 sm=1 tr=0 ts=6a432e35 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=aq8TV6ysMa56JO4HhR0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9S9EkLocWLm8mLR8R9bP9gXbATpvPSpy
X-Proofpoint-GUID: 9S9EkLocWLm8mLR8R9bP9gXbATpvPSpy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX76HHoOTKMRWg
 agya03RQgE8OcIQnK2T631m/Kdy9l/qtr508jDhavexFVoR33ujeUs4dXyZcIgD4vSVtP71Nb+7
 UfPt3L4bkU4Wv7c4Fb2F0lQhBmCP3TVWNHEmadIsAeb2GBIpFXcS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX63Ev6SVVuwPb
 Cteqj/AUVxY+ZZOY8iKuvHVZl/3a3apjLtYdhUhfKYNrsNbUmLh8vT3fFcyr9abyypxpM8VVjsY
 UYXgxQhZUiBawhS9nGTtu71mEy4BSlGGve4wSF8vLtxorih2Caw0lUnpoXEIS1JFha8fZg3CS3D
 0D1ymHh+/HcWgyO0Yi7K+kvOYrYv10rhSCSnBiGvsCr2G2Gzn2EqGsS15WsBZLic5/hEz1U2t5u
 PQoSEVnko6W3q1VYl9Ch3rP33QG4LOfN5MGRJerpFoI+9ghTY9kpDV4k/4n+OQRBiPBO6UDACyo
 4OS+HNYMDYvZVtFewXgFlouWiazshDEOMNnCp00NFLVjBn/AOSejyBEwaTsC0iJQ0w9Pa36rxN1
 u/K0b16w1yBRm7DgpjZFTOgZMPdMhsxTvci761YZx1rAHKVpfkPjdw4o2O3TiTV5kKKIWbjSrMy
 7me6tz0jmfoBOtN5q8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15455-lists,linux-hwmon=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:dkim,analog.com:email,analog.com:mid,analog.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alexisczezar.torreno@analog.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:alexisczezar.torreno@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexisczezar.torreno@analog.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 293906DFDCD

Add support for the GPIO controlled EN pin. The EN pin is asserted high
for device to operate.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max20830.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index cb2c23672166d641852199ca07eb716924f4f286..cb3a39d747edee3aefb0fb4051ef957436b3c15b 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -29,8 +30,14 @@ static struct pmbus_driver_info max20830_info = {
 static int max20830_probe(struct i2c_client *client)
 {
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] = {};
+	struct gpio_desc *enable_gpio;
 	int ret;
 
+	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
+				     "Failed to get enable GPIO\n");
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_DATA) &&
 	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_BLOCK))
 		return -ENODEV;

-- 
2.34.1


