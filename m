Return-Path: <linux-hwmon+bounces-2091-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 563868C02C1
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 May 2024 19:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC4E1F240E4
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 May 2024 17:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D690312AAC7;
	Wed,  8 May 2024 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wPoCaEd6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6FC128383
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188455; cv=none; b=J0VWeXT2HWx4Yw0UmiG7wduNt79Pp5aNk91f7dF/uly5GJjReefgQ5LTXjW/oQc8GrzQg0jVf6coq3V7mUXhqaeF7baqPlW+7fXcA7nUcB26CUUanTWM1BiK/ypsciuf77AuWLJ13K/Pa1PIEQHFGTKnGisaULJUR/3QLAOpIvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188455; c=relaxed/simple;
	bh=wBIe8L/kzS+iFaHUIe5MJ34qQDJlShFdBDx5Aipq6MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JM4JQTaetRVqR4+njP/6CnKv/LL2VFR3NAnxwkEX+Z6fWg4ujB3hUTNOz9Wh+WZ6bz87aguTlyWWH/DLZb3GwTL/AY8gqZTfzQ32X/RRJxIoYX+MVETp6My9IzKmVnr22zEP8q3LZIH6ncg5hBRvxhJ7i3pr5Bu3YamHPaBeXnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=wPoCaEd6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 21CDD2C0240;
	Thu,  9 May 2024 05:05:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1715187948;
	bh=0z3I4FWLpGwn1DF7NS3tZlEXDhBmoqyxj/U0Pm5RNgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wPoCaEd6WxiHVoe20gXL4BVy/S+3W1Dh05IEZh+wZm7X/7GDC4i2Mi9WY7wy3Td/n
	 +UsMSbt9UgrWoSVl3ou+ySJq37rJ+RkGyD1vUg8SLZN+Hbx0pxfov+VQA0FQxHjIwJ
	 d2v1MIumAgz1xMuYsEnXb3CQm1meC7VeEsPkT5NXkxomGn389j76P6g3b7AyjHoybf
	 43aW1ZyKdlrW9pba2BUNwJg+skpCr5K3Qnn4sCBf5A3V34Tv5mifzCIzPobfzptwcl
	 i6i6N8G770K6RaD2KrrPwEVPavfYgwDJk0zweAU4VkT78xUXhO3NeKTBX2RoFOHBvR
	 QMgt2FfIb0uMg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B663bb0eb0002>; Thu, 09 May 2024 05:05:47 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id CCFD713EE83;
	Thu,  9 May 2024 05:05:47 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id C9D5C280461; Thu,  9 May 2024 05:05:47 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] hwmon: (adt7475) Add support for configuring initial PWM duty cycle
Date: Thu,  9 May 2024 05:05:43 +1200
Message-ID: <20240508170544.263059-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508170544.263059-1-chris.packham@alliedtelesis.co.nz>
References: <20240508170544.263059-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=MfrPuI/f c=1 sm=1 tr=0 ts=663bb0eb a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=TpHVaj0NuXgA:10 a=62ePmnuN2cZSMFv3--EA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

By default the PWM duty cycle in hardware is 100%. On some systems this
can cause unwanted fan noise. Add the ability to take an initial PWM
duty cycle and frequency via device properties.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/adt7475.c | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 4224ffb30483..b0c7c1a95897 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1662,6 +1662,54 @@ static int adt7475_set_pwm_polarity(struct i2c_cli=
ent *client)
 	return 0;
 }
=20
+static int adt7475_set_pwm_initial_freq(struct i2c_client *client)
+{
+	int ret, out, i;
+	u32 freqs[ADT7475_PWM_COUNT];
+	int data;
+
+	ret =3D device_property_read_u32_array(&client->dev,
+					     "pwm-initial-frequency", freqs,
+					     ARRAY_SIZE(freqs));
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < ADT7475_PWM_COUNT; i++) {
+		out =3D find_closest(freqs[i], pwmfreq_table, ARRAY_SIZE(pwmfreq_table=
));
+		data =3D adt7475_read(TEMP_TRANGE_REG(i));
+		if (data < 0)
+			return data;
+		data &=3D ~0xf;
+		data |=3D out;
+
+		ret =3D i2c_smbus_write_byte_data(client, TEMP_TRANGE_REG(i), data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int adt7475_set_pwm_initial_duty(struct i2c_client *client)
+{
+	int ret, i;
+	u32 dutys[ADT7475_PWM_COUNT];
+
+	ret =3D device_property_read_u32_array(&client->dev,
+					     "adi,pwm-initial-duty-cycle", dutys,
+					     ARRAY_SIZE(dutys));
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < ADT7475_PWM_COUNT; i++) {
+		ret =3D i2c_smbus_write_byte_data(client, PWM_MAX_REG(i), dutys[i] & 0=
xff);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int adt7475_probe(struct i2c_client *client)
 {
 	enum chips chip;
@@ -1778,6 +1826,14 @@ static int adt7475_probe(struct i2c_client *client=
)
 	if (ret && ret !=3D -EINVAL)
 		dev_warn(&client->dev, "Error configuring pwm polarity\n");
=20
+	ret =3D adt7475_set_pwm_initial_freq(client);
+	if (ret)
+		return ret;
+
+	ret =3D adt7475_set_pwm_initial_duty(client);
+	if (ret)
+		return ret;
+
 	/* Start monitoring */
 	switch (chip) {
 	case adt7475:
--=20
2.43.2


