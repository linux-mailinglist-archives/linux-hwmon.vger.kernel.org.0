Return-Path: <linux-hwmon+bounces-12717-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGHMH0GDwmlneQQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12717-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2026 13:27:45 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE730833A
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2026 13:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CB7830F0437
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Mar 2026 12:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DFF3F7AB2;
	Tue, 24 Mar 2026 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbUfyq4f"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DC3F7871
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354904; cv=none; b=Ijp/acGLbMGTP58HI0YEYv8cxSRZn9xZ2Ah51RNoxUSFd/1ibcOjURQcajvzptwDTOGHsopkQbwa/0wKtOKYGFyANBv1p1X0YUOUoLDv5kxPbxPfK1YdafVc0gnmAAKov65BJ2C+jeMuKOFMfyBrg4xUjiDjh2iCg4ayIZefeN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354904; c=relaxed/simple;
	bh=AUx8FstDbbu+ZQlA6z4YmFRV2wZZ0u1yLkF/7qjbQJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=L1g6hjGiqxxVNNrxUssKcAqtA7AORmR6bPf+PtnvkF6mi7EEXbCuz/jQf7HYMcwJe2SzAIl94smb7KdwFdwi4m67EvbtPR0oJZdXNvR9b5nJVL1Ks4Ht1v0xolk9J3scsZxylWj/wIMrMHtYVX5pcitjC/1nWB8w4rKi2mKbow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbUfyq4f; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35bb7afdc38so644364a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354902; x=1774959702; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9uhH2liBN3NmDc7LnY+4t/w58Z8uzkgXzPx2s61DrE=;
        b=kbUfyq4fsx/f35LCiUIaRIo73KEa4EIi5yz62SvFuYZ53anzvN4NJtI/ds7+Gp8S0W
         mlO2m11eC9++xSAMucdiWXF5FwfqbiwuMPxDWpPyPfnIAJjqga7sem9kIVNUxYMC7a5H
         qG0F/JAUQYtLqPynbFE6EmHWEF3sIssMg4u2kp5aevnPmR1CcQVJ+8h5J39HXgQ3HKJk
         mnmKlzvEi7TjG0+eje5MJIa+wsORcx8xRTmZtpyO2nuUY8QRiGTfxIs52bHB3Z/ukOPn
         kuFdz/+MDn2SwVU5kWBmEgblhXJOENcZBsRsdeA5pD+7wGZjlpq0aWV2BhW7jYJ8BijY
         Cj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354902; x=1774959702;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9uhH2liBN3NmDc7LnY+4t/w58Z8uzkgXzPx2s61DrE=;
        b=P8r4cCcaQe88FntD4iHNYELsQayQqSKhYByRd6WL4SknpO7ZwzNCcN+W3xZnOS5dEB
         g4f3FfJVoKehJz9pbDArP8PWcNIcXA5wHaUNf9+lI/HrgmRjyp/G2EvfrA7YBLB1GajM
         JMhGERvnlQTPyl7EpE/Geq+KvkFBjY52Uet7tPnB21xW5p7BwaculbwnGXg86srnxN6B
         76gpUMi3sZ/y7kyDKlPAmUX1kYIy2kVw4e9xHGRA148aCssB5jCZA9xWUoo9Z+7PLJZf
         En5JTLEMFRdrll3fqzO9tCuTrG6ExP5Otk9Qlw8edk0ORdxVC43loaOK061uxnyn1Wgc
         lthg==
X-Forwarded-Encrypted: i=1; AJvYcCVD+adHBFGMVfjhyQDKpjga8+lhdXcrAqpXjsD9MTqE+jDhiQKhIBAn9xgcx75VHceCeCeSsKjw/KMv/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YztGqp6sdCRqnHABiuFte8i409nPTjeSB814PnE4bvb5kltk9ll
	DDXPiyN4k/d42iUA9kpU80nayodTWqHzSkbAbMEa131nBXfChABRWaq+
X-Gm-Gg: ATEYQzwq9b8oDMP6IFvilAm/jZj8aTWxwTn4hjG2p4vWQYS7iqTOKBlHsyVlCFMeh48
	JCwl4cW0n2c/uVyyLX1pf5Cbw++tl5B+fuW4PXOsYDaR68IfXOE6vAmst1NDlOe8PJDNXhKiaWT
	Q0fUCbfJnYIvOTIyrJAaL0AbiRbwZiu8OVT8+g+PLj7SbDXCWWfZU9eM5wmbOSOv317lX4yrNWd
	jUeGmKiXMxqLYLWTr3GWqTCbPM3nU+1Uc/ueluifNF+KZzJRvTU98xrZLyanPaEkA5oOgvM/dTt
	D4Esu/fypPnKAmD7CVZ/u/ir7lAA7xeX9gpxPJosIY47FBfhsJJ7L5MNHeZDpPhdWrT0/DhRmxe
	rYTxTUi+4LI6lP2nod5mW/u2tqrAC/4auMqZe3JCYjpWp33bIsSUZn/9xN0YSBFIdpeBCsQgOHk
	5WB6oTiEvxtEoy5xFL/aEO017biT1mmSfNlEG3udYPVUf4HYHbr2Fk
X-Received: by 2002:a17:90b:1dcb:b0:34c:c514:ee1f with SMTP id 98e67ed59e1d1-35bd2bf4d56mr14915578a91.11.1774354902526;
        Tue, 24 Mar 2026 05:21:42 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:42 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 3/4] hwmon: (sht3x) Add devicetree support
Date: Tue, 24 Mar 2026 20:21:08 +0800
Message-Id: <1774354869-119736-4-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-12717-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2FE730833A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add of_match_table to support devicetree based instantiation.
Specific compatible strings are used instead of wildcards.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 08306ccb6d0b..64404fe83f0b 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -939,8 +939,23 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30" },
+	{ .compatible = "sensirion,sht31" },
+	{ .compatible = "sensirion,sht35" },
+	{ .compatible = "sensirion,sht85" },
+	{ .compatible = "sensirion,sts30" },
+	{ .compatible = "sensirion,sts31" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.34.1


