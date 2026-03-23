Return-Path: <linux-hwmon+bounces-12653-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCi1LSrcwGn6NQQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12653-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Mar 2026 07:22:34 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B02ED01F
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Mar 2026 07:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B648A300460E
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Mar 2026 06:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BAA2D8793;
	Mon, 23 Mar 2026 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="h/ncXDI/"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9C175A85;
	Mon, 23 Mar 2026 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246948; cv=none; b=gp/Xo9bTsdLFDjrJQ82Af5s4uZ5J32oK4WUphVvqTl4x98pxCaAe3sszIZkoijt17gP3B2Og4OEvZCLJCaH0jtBZQL8LeCJP7NXXFfHkbyezSkNF1esgxBwqKQ8PueL2Itv6ZYxar1mh896d7yfsfCpp54YBBvceXPsnMF/gNLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246948; c=relaxed/simple;
	bh=C3Jk+havheEvSNjBbieXqRyaODbSdgXw2Er3e1mHqN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WPU7zmgAL8Fcod+fYcxD5Y/oR8aRA15F6KtUqnwO4Vcw6+GaAkkJ/LLxILh0xIgdeCzhTH6yxKnQpyUSa74tGxrvk6OlTv3k9ksT7fOiP6wo5R6zizmHuTKwprXCgFa29Rr4EzGBarfErQYnvC55TwEQ+LqaWGZ8HFCg2JjiboI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=h/ncXDI/; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=By
	Nh+ZVMLlFAwQU1VPxOfH5E1NoPZjDNDG4koGc6CSU=; b=h/ncXDI/OOBQV3QRKF
	aGMBsDzYbchZcX8a4lopM5WEXJ5xvbOVEacGY3rt61R2/AnU1dHoiB0VsY2cR+Ba
	lBJVUGBsfy0zOx2C33ka8cFQF47hFN54LkjW03C6OQfY6LsUgND1YISpdkVkP70S
	pzfPg9Y/fvvixYPXHAKev8cOM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPA id Mc8vCgBH7_jS28Bp40yaAA--.366S2;
	Mon, 23 Mar 2026 14:21:07 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp2985
Date: Mon, 23 Mar 2026 14:21:03 +0800
Message-Id: <20260323062104.827263-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260323061901.827025-1-wenswang@yeah.net>
References: <20260323061901.827025-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgBH7_jS28Bp40yaAA--.366S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWxXr47WFW8WFy3Arb_yoWDurc_Cw
	4xZ3WDCrWkJFyfKan5AF4kGry5Ww17KrWUCw18t3WkXF9I9rW5CF9aq34YvryxGay7ur15
	urn2qrZ3XrnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMXo2UUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIhS2W2nA29T8cgAA3z
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,yeah.net,oss.qualcomm.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-12653-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[yeah.net];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenswang@yeah.net,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[yeah.net:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yeah.net:dkim,yeah.net:email,yeah.net:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB2B02ED01F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2985 controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
v1 -> v2:
    1. add Krzysztof's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..d61482269352 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -325,6 +325,8 @@ properties:
           - mps,mp29612
             # Monolithic Power Systems Inc. multi-phase controller mp29816
           - mps,mp29816
+            # Monolithic Power Systems Inc. multi-phase controller mp2985
+          - mps,mp2985
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. hot-swap protection device
-- 
2.25.1


