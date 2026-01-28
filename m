Return-Path: <linux-hwmon+bounces-11444-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHQ5DCS7eWnoygEAu9opvQ
	(envelope-from <linux-hwmon+bounces-11444-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 28 Jan 2026 08:30:44 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD6C9DC27
	for <lists+linux-hwmon@lfdr.de>; Wed, 28 Jan 2026 08:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04DF93008504
	for <lists+linux-hwmon@lfdr.de>; Wed, 28 Jan 2026 07:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B0E23507C;
	Wed, 28 Jan 2026 07:30:41 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C421DDF3;
	Wed, 28 Jan 2026 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585440; cv=none; b=BuW+nlp9EIQBLIUjZ9Ug5VT5FZ/WCm5aql679aVmKesVfnSbjbRkITxy9RJjU3pm3hGMjlYku5Ms6qOwgbYsu6ogkgb8q15bGOVlU+8Kihe6QyKMXbBbyNc8AwDLBkzBc43p4oflsIce6KxXLW9tLkA3DYsrV6JJwzpPcwVZgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585440; c=relaxed/simple;
	bh=wUBlVoLOpPbGUz/k2o0fNyttPS7m6EELoT8dQwrXsrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZQ6EEkxtBgo9V/dKC68H2bT2xnVCA7Rk4q55TSl6H5ubp6cwy0wwLMTQ/MKqBe/ttCCgFmxDPa62V6udvhy355dmy2YOstt+CtPsjQVnDJebN55mjFZowvx366Sb+dxzPTOyxuiq9SuS0+Lz7rjPY12ElcGGOcKkaj29M+W1zrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACnOQ0Xu3lpCBfdBg--.32552S2;
	Wed, 28 Jan 2026 15:30:31 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: etremblay@distech-controls.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] hwmon: (tmp513) Add missing check for device_property_read_u32_array
Date: Wed, 28 Jan 2026 15:30:21 +0800
Message-Id: <20260128073021.2476709-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnOQ0Xu3lpCBfdBg--.32552S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1UCryruF47Xr17Cr1UAwb_yoWfurb_ur
	4xu34xJr4rAF4SyrnrArWSvryqvFsF9FsxWrs2qa9ayryUW3sxu34Fvrn8X393C342qF17
	uw1DAa9rA3WUCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU7DGOUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[iscas.ac.cn];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-hwmon@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_FROM(0.00)[bounces-11444-lists,linux-hwmon=lfdr.de];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 8FD6C9DC27
X-Rspamd-Action: no action

Add check for the return value of device_property_read_u32_array() and
return the error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hwmon/tmp513.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 5acbfd7d088d..f201d0a9ba14 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -676,8 +676,10 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
-				       data->max_channels - 1);
+	ret = device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
+					     data->max_channels - 1);
+	if (ret)
+		return ret;
 
 	// Check if shunt value is compatible with pga-gain
 	if (data->shunt_uohms > data->pga_gain * 40 * MICRO) {
-- 
2.25.1


