Return-Path: <linux-hwmon+bounces-14846-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMJMAEFeJmoOVgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14846-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 08:16:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A79653125
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 08:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q3549AK2;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14846-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14846-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8567C300D955
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 06:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C2F34D91F;
	Mon,  8 Jun 2026 06:16:08 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF52EEE60
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 06:16:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899368; cv=none; b=m1vGv0w0PLKGX3P3mN/ZDg03LQVrgGf7BPbjYnlFqOIT9BrS+tfxVDX9CYppGUuWLycEcJQ0hxINQnpuyWV47TGzAltDYQra6RREY7uzpFeDxzsoW1vxFWFYWev68GjCIefKYBvWFP0pF8zUMWTs10ENW4wSf8TsITrJn5fZwM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899368; c=relaxed/simple;
	bh=983if5RJxIBnKlxqF6madh7kbfmJiNMks+/dNvYgVKI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KKFOZBZlVO2ceOkHsXgYOTus/zXFYMQb3ZqmMbDuVoWkl4OnZCiidWTqMV2e2E0zkmHLCGtB7eTyAvPAYqZtg6ldO0ZAkbRefR9WctfvTatAvlUfwOoWUKrjWVI6Wu+vhm4+7yt+sowGaIQwp7wPa0UP7HzMoF2J4dt9tJqttxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3549AK2; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0a5354da1so31205755ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899366; x=1781504166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+PD4CTA8PfLA5d/ZXAjsrghYdKuBD/zwG8HHgtzVTY=;
        b=q3549AK20gRBmnB+9A/1n+AD/gBDEMFtNCmSnjKdp8UCKLxzIZmRCrkX8W1y/orud6
         mVfC9xyxMXzHDlZxcqiWkdJ+iw54BL2gYqa41H6LYwRSSvLQzs4hLv4W11IJ99fzl3ZE
         BBJAsJxzlSri74KZetypN5L36ozViTpa4m1VjxgZwn5S0ts/Saijnk0I4GadmsjQyu35
         1PbgFUzfai9lUJKDWkhBic84ufO8TxSy2caE/XNoCAW5g+WBatnU1q4eSRbABZp6xt3m
         n4V7WltY0kIFKoE10RzmMUWmdXA4ZlOiqqTq8QD8SnGjV2zbFhkHf53P7SvSDV1kTSPJ
         QoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899366; x=1781504166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+PD4CTA8PfLA5d/ZXAjsrghYdKuBD/zwG8HHgtzVTY=;
        b=IP7XXoRVq5agdxVexx/boxqnCuFIy3JZszHDAMCaK6qiHelHtRzo1hj5sR8JSIKg4S
         3yMkjOem/9H4P9c/SRTMXhWsnHgqPnNdxyvo2POnjVVCDheemKrjZZWIXiBxIkgf2SK6
         irgs5fVh//EM5gndHoMwdmUy0EktQFYynPZfPTMtfiS72RsfGux/BG8N6mXEbJKLEYSA
         6TccnpXNtJnmmclKhsLg9rppgNMwEY+tOpUuykIGhV4IvOlC+mKEYbrsJGpSRO8C8W8v
         vIoNo3H1vfPqvryHQziAYuk/EcAmhoDqKGnZEz3hkEmuqe874VPXvw1Tnn/9eQcSyA/Z
         t1LQ==
X-Gm-Message-State: AOJu0Yzr3lM1aSKGQNCdB5s5mTIRh94Eg2Iyfb9whVqxX5/xrQLbvGj/
	qYh8G/qteZf6r+e46PY95xmllVbnJMl2x6m8RQ+mw02KavEzSnLyhkeJ
X-Gm-Gg: Acq92OFaHF2my3G73iBlgZdYJHGrHQTtg3hxofIZYa06BqbTLNliddJ3a0vKHqVdJpy
	TgTcOrBSvhlhW26BdKAs2s1UF+JRVVsEo/QQ0XSTpb7/T3xsOEGs8U793ZrRC8tYloiBPwAGGdz
	8BGrhwDyhVXgJdwmzBnUA9avP0WUaj/fsjhEKzKgOHVFEGzP+PtwhT5ZpQAlJ2AFLLI+sVzmmap
	L4Y0E62kW9iQygDzIyHP3VARCbu/OCvQ/CyaYVXDmXK0moeAEJMCOgW9clNIRsXpk3zYtg5WQYE
	qCePKKPfsmvV9ZP2Y4tAuCj2xG6ur9ZR65UgMk0AnSHHNy7m9QdPSRsuvhW90S5yFmZ1HYnHoGG
	2ZvhhHUOkiH33DJV1yzodhlRLdoWYbdI11httYDerYKM7inK39apgatsMJMuovJKSzGMFD8lh/O
	KRYTkhj6J9GVbfAIwtOpxP3R7DaikCtexy69xBpkMyu0zFkrGBLsWIYfXK
X-Received: by 2002:a17:903:1b43:b0:2c1:88a1:9839 with SMTP id d9443c01a7336-2c1ec527f50mr119171525ad.11.1780899366475;
        Sun, 07 Jun 2026 23:16:06 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9004:8bfa:6dac:310c:dd97:e630])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm173856925ad.82.2026.06.07.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:16:05 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v4 0/2] Add support for Infineon eFuse xdp730
Date: Mon,  8 Jun 2026 11:45:42 +0530
Message-Id: <20260608061544.5613-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14846-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ashishyadav78@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ashish.yadav@infineon.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ashishyadav78@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55A79653125

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches add support for the Infineon XDP730 Digital eFuse Controller
by updating the existing XDP720 driver.

The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
with an integrated current sensor.They provide accurate system
telemetry (V, I, P, T) and report analog current at the IMON pin for
post-processing.

Both parts share the same PMBus register map and direct-format
coefficients; they differ in the GIMON gain step exposed via the
TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
(XDP720: pin 9, XDP730: pin 20).

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.

Datasheets:
 - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
 - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---
Changes in v4:
- Link to v3:
https://lore.kernel.org/all/20260601090925.3781-1-Ashish.Yadav@infineon.com/
- Drop extra I2C Device node and add rename node info in commit.
https://lore.kernel.org/all/20260601-first-attentive-puffin-d7ca66@quoll/
- Revert back patch formatting.
https://lore.kernel.org/all/bf947dcd-2028-4dfd-a007-c4f39d2b7649@roeck-us.net/

Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260529054218.5184-1-Ashish.Yadav@infineon.com/
- Revert back the DT info file name to infineon,xdp720.yaml and added
  xdp730 info
https://lore.kernel.org/all/20260529-partake-myself-baa76ed4e279@spud/
- Revert back the driver file name to xdp720.c and added xdp730 support
https://lore.kernel.org/all/20260529062937.646091F00893@smtp.kernel.org/

Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260519075558.91466-1-Ashish.Yadav@infineon.com/
- Integrated XDP720/XDP730 drivers into one driver.
https://lore.kernel.org/all/51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net/

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon xdp730
  hwmon:(pmbus/xdp720) Add support for efuse xdp730

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 28 ++++--
 drivers/hwmon/pmbus/Kconfig                   |  2 +-
 drivers/hwmon/pmbus/xdp720.c                  | 97 ++++++++++++-------
 3 files changed, 83 insertions(+), 44 deletions(-)

-- 
2.39.5


