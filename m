Return-Path: <linux-hwmon+bounces-11885-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL/nL/y5nmmfXAQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11885-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 09:59:40 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C1194851
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 09:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 581D73026A43
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 08:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF1432E727;
	Wed, 25 Feb 2026 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ENNxH2Go"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1796281356;
	Wed, 25 Feb 2026 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009970; cv=none; b=siV6GgAV6zlfSmcmNxR82BAIoO+AA3KLeKzGPGzffQ3z6KmTZLZVGnKFbC+wvBmfQA7udhErSFRoRw8suXj/bDKpcOW9hW9ylqOJojXbJCk0RzwXsVlvKmMYR2H7+BlCQ/8T274IRFdnm1ihaqQGVgMfdbOdJLbfCWCemD0DubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009970; c=relaxed/simple;
	bh=JHCrCI6PyM6x5xtzpx0Q1fATrnh1+CDrneytWqJwNxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kU0+/+kZbVtj1uc0HyMHhwoCkFIjDM4XA+3v40uQe21nLTLEMTSRzJKyL9kAxOY9LrWlRGChxJ6J1OGZmZk7kHFlOybTuTLydnhkUjHHNYblrByHzZq3OmI6pOLHBR2cEquDOMvme1Le4DoQ3Vx2MCGUAY9Ra953ZGqaug3uoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ENNxH2Go; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=p7
	lLDgqA3xWPGpNCA5ncLNpfF6ohE/14PLeif+5X/e4=; b=ENNxH2GoW0u9gwvs0f
	v5TEpDSXYqKdTq4+fGcwx7A7G+VLoQ3kSr4HBbRIInEtiFLke68jz1CNYoEs5Wy6
	wvMmRFIkbG1k7RKJmssmY7Y2vmL/5BciZnSogIEiDU9HShiJotKTTiVgdczfar88
	QlglUTE1+yyIrTFzRKOaLk8NA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgDnv49DuZ5p3qKHAQ--.38590S2;
	Wed, 25 Feb 2026 16:56:36 +0800 (CST)
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
Subject: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp2845
Date: Wed, 25 Feb 2026 16:56:30 +0800
Message-Id: <20260225085631.165106-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225085501.164819-1-wenswang@yeah.net>
References: <20260225085501.164819-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDnv49DuZ5p3qKHAQ--.38590S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrW3ur4DGFW5WF18uFg_yoWfuFc_Cw
	4xua1DCrWkJF1Ig3Zakr48JF15A3W7Kr48Cw1ktF1kXryfWrW5KFyvq34YvryxGay7ur15
	CFn7KrZ7XrsIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNL0eJUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiNQWBJmmeuUVB7gAA3z
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11885-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,yeah.net];
	DKIM_TRACE(0.00)[yeah.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[yeah.net];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenswang@yeah.net,linux-hwmon@vger.kernel.org]
X-Rspamd-Queue-Id: B13C1194851
X-Rspamd-Action: no action

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2845 controller.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..2c6c84185bb3 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -303,6 +303,8 @@ properties:
           - miramems,da280
             # MiraMEMS DA311 3-axis 12-bit digital accelerometer
           - miramems,da311
+          # Monolithic Power Systems Inc. multi-phase controller mp2845
+          - mps,mp2845
             # Monolithic Power Systems Inc. multi-phase controller mp2856
           - mps,mp2856
             # Monolithic Power Systems Inc. multi-phase controller mp2857
-- 
2.25.1


