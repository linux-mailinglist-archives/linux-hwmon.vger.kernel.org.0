Return-Path: <linux-hwmon+bounces-13094-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIWBMgkg0mmDTgcAu9opvQ
	(envelope-from <linux-hwmon+bounces-13094-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 05 Apr 2026 10:40:41 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DB39DDEA
	for <lists+linux-hwmon@lfdr.de>; Sun, 05 Apr 2026 10:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC7583003D01
	for <lists+linux-hwmon@lfdr.de>; Sun,  5 Apr 2026 08:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340DF370D48;
	Sun,  5 Apr 2026 08:40:38 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394E932AADE;
	Sun,  5 Apr 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775378438; cv=none; b=hRp6T9FMDet5izhUpWSzPN4aAlD5TPLLZmiNUe7oCqnqaRmEK90iH0VjDXeHXdcdwTXGd0+AyTOqsGcBYL/zXyKFfot5/s1EDAilW5Ab7p8HtPaXfuDZMRs4rIZQI125HOFINh/gih0H23GczbCgZrV41IptfKa+8SpcY3DhlsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775378438; c=relaxed/simple;
	bh=NLsHC08Gf/BKKuaHtNaF+xwoUM2b1HLo12SDyaQhBIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GNF0Vz0PCIoxe9jMcLjJa81f/zgEwLQ5UcBG4aYEi3lyZmdMknP9xoxDdk9iNx6HHgjz+iaCqBVYfpUykAgbY/tbc7v75M/Ex45jeDwdsabx5tQKoyj5rYlHX2bRjKL/OrunGLEjpigp/A0tkWnqfnNnnPVzdh57QSTx7iTHycg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 159f474230cb11f1aa26b74ffac11d73-20260405
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:14e7cef9-49c2-4f14-adeb-1ae70a863dcb,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ab8c0f9b6c6345f06fb8c431de7791b1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 159f474230cb11f1aa26b74ffac11d73-20260405
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 702792376; Sun, 05 Apr 2026 16:40:22 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 2/3] hwmon: (gpd-fan): upgrade log level from warn to err for platform device creation failure
Date: Sun,  5 Apr 2026 16:40:17 +0800
Message-Id: <caa3e210f92e1016f29ad9831b2dd83aeadf2879.1775378028.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1775378028.git.xiaopei01@kylinos.cn>
References: <cover.1775378028.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	URIBL_RED(0.50)[kylinos.cn:email,kylinos.cn:mid];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ANON_DOMAIN(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kylinos.cn];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13094-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopei01@kylinos.cn,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-hwmon];
	R_DKIM_NA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 755DB39DDEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_create_bundle() fails, the error is fatal and prevents the
driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
a critical failure.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 5a9d07cd29ab..7df46027177d 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -714,7 +714,7 @@ static int __init gpd_fan_init(void)
 							 &match, sizeof(match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
-		pr_warn("Failed to create platform device\n");
+		pr_err("Failed to create platform device\n");
 		return PTR_ERR(gpd_fan_platform_device);
 	}
 
-- 
2.25.1


