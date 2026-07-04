Return-Path: <linux-hwmon+bounces-15563-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bsXqE/7CSGottgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15563-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 04 Jul 2026 10:23:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0B7070F9
	for <lists+linux-hwmon@lfdr.de>; Sat, 04 Jul 2026 10:23:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yeah.net header.s=s110527 header.b=oN3HF1WB;
	dmarc=pass (policy=none) header.from=yeah.net;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15563-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15563-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A13643006785
	for <lists+linux-hwmon@lfdr.de>; Sat,  4 Jul 2026 08:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2985A30D41C;
	Sat,  4 Jul 2026 08:23:01 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C19339061C;
	Sat,  4 Jul 2026 08:22:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153381; cv=none; b=AXTLpOtbtUlZ/cEolSWPuQaqIRyxlEkS6tCy540j2vzc1HXU4+ow7ff/JNOCJ97yzwvcRvi1+/Av0yjrZWmOmxKonqX0Mvy4NtRAjga40+PNbAVjJbCcBocjYrYC0CQc5zTzPrmsiWGJ1u9W1baA8ynSljAx460CCh4AoOAnAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153381; c=relaxed/simple;
	bh=cRn7m7brK78nGuXGnSYGpDMbZJ5hnbiW6pjZObSP6sM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rmSktW2hmBQjykyVU3v95X1DGMn7Q5mTpq+SX3+RHJA7KBau4Ll41XoWEH7Jm/QBgZgSUoEVIicQZUsoU5Mk2mCOmEDuvLCvVDod+OvmGuAPaxkkd3N2kjD8SbF1eQxpvukoeia4UwLnzo76O58qwDGsaPzuh7WvXDzIZl8lLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oN3HF1WB; arc=none smtp.client-ip=220.197.32.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F8
	7PwsKShk0cL752xeSe+Mho3WGWHLs8rWeZWmjsF2E=; b=oN3HF1WBPzCg79vsTO
	w+KMtadumlsr522WyclWT13/WTzALLxoOQS7lKHqUC4npLzI+HKn5aiSw7ywy+Uv
	DtggskyD6FQmYk3rsooNhQw27PhAB8icckI/1snql2zYVJ8+xPJ1hOoK7b3UyLC5
	TBj4CwpH7Q/kI702ShfNFqViU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgD3308rwkhqyJoLAQ--.13660S2;
	Sat, 04 Jul 2026 16:19:55 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add MPS mpq82d00
Date: Sat,  4 Jul 2026 16:19:51 +0800
Message-Id: <20260704081952.1701914-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704081810.1701587-1-wenswang@yeah.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgD3308rwkhqyJoLAQ--.13660S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWkGryUWFWfWFy7Awb_yoWfCFg_Cw
	1xZw4qkrykJF1Sy3WYkr4kJF1UZ3W2kF4UCw1ktF1kZ34S9FZ0gFyvq343J34xWF47ur15
	urnaqrZ5XrnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIgxoDWpIwixbhgAA3a
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15563-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wenswang@yeah.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wenswang@yeah.net,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,yeah.net];
	DKIM_TRACE(0.00)[yeah.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenswang@yeah.net,linux-hwmon@vger.kernel.org];
	FREEMAIL_FROM(0.00)[yeah.net];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yeah.net:from_mime,yeah.net:email,yeah.net:mid,yeah.net:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBE0B7070F9

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mpq82d00 controller.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..8116f21bf8be 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -362,6 +362,8 @@ properties:
           - mps,mp9941
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
+            # Monolithic Power Systems Inc. digital step-down converter mpq82d00
+          - mps,mpq82d00
             # Murata D1U74T-W power supply unit
           - murata,d1u74t
             # Temperature sensor with integrated fan control
-- 
2.25.1


