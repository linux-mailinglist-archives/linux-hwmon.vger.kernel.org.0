Return-Path: <linux-hwmon+bounces-15846-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hBQvEjWsU2pHdQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15846-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 17:01:09 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87804745124
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 17:01:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sMG8L5hP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15846-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15846-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 228743019BA6
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDB833A71A;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73F3385B6
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 15:00:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868454; cv=none; b=n4zZgiGyfddbmo2VeFdQAwkBaoVk2nZPQfDC86l+x9kqCvbPhqnwNYfblv58j1ObkVl3xE7n4suLF4JGv4bHe7hIiNuUo1t4u6lZE2avmnGHl4PTBfP2ww/CHaS+Idij265m/3oINGdvWC470HIQcJMg+aGhgfAg97hPBlwTG9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868454; c=relaxed/simple;
	bh=BWfkWqkRlQKzl8mKCq2A9KQ/GkMIzCJhbc4vJsP9mDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7JYC0t7RxL4MYa2i5DpTgBgWqYmdZNSA8DVVVYszDk4TuO7FWBCp9X6E3MLxG4qmprPq4PBpvcq9wK29CbQh5VlOYhV6K9z5xtCXztgFb7FHfSetZCOyaR3s6XvBRxkcPhFlaDoLoa/znRc1bZDe0MrmX8YwNCLRIsIlIHhoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMG8L5hP; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso13662955e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783868452; x=1784473252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDKf75qrR4FnYkRe8a57ykunyT8bvCyYnpQW7qx2SrM=;
        b=sMG8L5hPfHL0bswXHZ8ynUv6bFY72blMKdQ6Ns55bUaZhbIDz9mnnv6siJEjbWpOcD
         /QcG0rxKnvf5+H/CgJ5dxxFUvTxl6/wRAtSNv89pQTBnT0dshfkdvDIf69p+yy8SHw4n
         KTqg7XPJrPYvdCxQ30/mAzUz8Jw4H9gd6gyAWQQSbNdGSyAFpBtLZuTI21hSJuvH8xju
         w8yscLcGJB478sL5A+Brmd9m8pbi6a1pCLlMH70YF7oIPjgeJc6jLl3vpUYao0eOSara
         HV+mXDujTGB1Y98di9X5WYGI3tBrZNB3KB9eDPM1o5EK4KZQvGyOEI+RWcK5pf+9IGMi
         M5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868452; x=1784473252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDKf75qrR4FnYkRe8a57ykunyT8bvCyYnpQW7qx2SrM=;
        b=U/KkH0m3y0lFExkHXcdVlrTIFQn9cEIT5kKJkKLmem6JlSwVkITpEXJHzLI5hgFZnz
         AMAiJfXZDPxq9wNS3qkuwWTnRdr2+lBzGUmwQ6pQJo2GXc5MOsCX8TD35OJmvqpN6irI
         0dCaKZheHGexAf7uwUEnVQemmeukgYrddTkob+1JW+88AFfR8naL7K4GmCLIpDA4FicS
         L/QvNJIKwMm2H/BktNjm404k+04UficQW7Yjdi4LrNegPn51/tsveCUznHUHkQDJ7csz
         B7twvJvMKZAWli9ZALeqdpgLnd1TUN+hKokXe2zvbQC9i+DTb8S7yPb4bOoNTS+8VSVG
         coSw==
X-Forwarded-Encrypted: i=1; AHgh+RobMK0bURsqfyi80fI2S5een2/Ytvz2kFfqoAojdG+ko3dp5QjaP7u89rOalOebiQUiWb9VHOhWhv79zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLYHT3ygIsGpVhZUuOjEs8RwQIt8E7+JeXZJsdsaCw/ykx7GP
	QCKnd/lMBDn8BqnQb4yTTtyOlYUoQKoiRL0fDUe/9Y4iGJS3MEUZy4uggFeAkmHP
X-Gm-Gg: AfdE7cmqzkFJqVOwn9wUnKZded0ayDV4g5cTrZ2BH5q4FLsaxcFQrYNac5au6GxDIdI
	KLBwSmKzq0wQRQSv0QDmeosGvAqcgZk/oRfDe9XGe1aOyBmnknzkUb7v/4bf0FEg5YMA8Ghz9ff
	SN4BtjkXJMG0qUAJ6IaF4JmT0p2SQb2DMyfmqdRthciKoJQlm6qkTWYiNPFDnxDL8ubxmYFmSqJ
	EhceusCjblcFy6E/a3MfACr/Y6QIg1C8Zlb7dVNRU2oG8LP3jJNOq1Lgz8GFOov1hFJOtkc448e
	LPp3NuCgUn5fRL0RvKVNJwfG+EvtBq9T418UGTpzYP0R6XRimntaceHs2JtSgV9fws1tZwDQfXX
	S14Q3xYadeDO1lMXhZnRTkAW15a7Z5as0E2EPwf3vKudo6hhKdc5JHCUUcOpsTRYJyquu86DBy1
	bOcQF92dNpdJwhJhG2zl7UHuGA
X-Received: by 2002:a05:600c:858e:b0:493:be08:c372 with SMTP id 5b1f17b1804b1-493f88b5d6amr56139475e9.17.1783868451645;
        Sun, 12 Jul 2026 08:00:51 -0700 (PDT)
Received: from puma.museclub.art ([94.31.117.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6e0e5asm296017845e9.9.2026.07.12.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:00:51 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/1] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
Date: Sun, 12 Jul 2026 15:05:05 +0200
Message-ID: <20260712130602.1256700-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712130602.1256700-1-eugene.shalygin@gmail.com>
References: <20260712130602.1256700-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15846-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eugeneshalygin@gmail.com,linux-hwmon@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eugeneshalygin@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87804745124

Add missing return value check in the setup function.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
---
 drivers/hwmon/asus-ec-sensors.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index eb71e41fd4f4..65d2bb1aa8ff 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1495,9 +1495,11 @@ static int asus_ec_probe(struct platform_device *pdev)
 		if (!nr_count[type])
 			continue;
 
-		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
-					     nr_count[type], type,
-					     hwmon_attributes[type]);
+		status = asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
+						     nr_count[type], type,
+						     hwmon_attributes[type]);
+		if (status)
+			return status;
 		*ptr_asus_ec_ci++ = asus_ec_hwmon_chan++;
 	}
 
-- 
2.55.0


