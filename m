Return-Path: <linux-hwmon+bounces-15078-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JDiPMrOALGr2RgQAu9opvQ
	(envelope-from <linux-hwmon+bounces-15078-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 23:57:07 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0267C9D5
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 23:57:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=M2G3Eb5j;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15078-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15078-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81414304E326
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 21:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB1938F62F;
	Fri, 12 Jun 2026 21:53:41 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E76376A14;
	Fri, 12 Jun 2026 21:53:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301221; cv=none; b=U0M+KjyUiKcioHv6b2zm2lXtloGNH3cNtggF6LW8Nid4iL+8hIdS4FcL6hzoD/wQyM8OnUp1ts8CZjtuDxoTcnwz4zMg8+gtqnLfz+Jyd3bsAEryaeIqz4yP2LGbKt9SvRr104bu7Q7QkkB1G6pnAup1dLKW9etRr7xYyot2jk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301221; c=relaxed/simple;
	bh=T82AX8D3r7dVoxCmKEMoc/mlSy9r/Ja50vhSlI9RTok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+2EytOW5CGx6ko05NY68lyTaJ2cQ6QI7I4POnW0IslsxJ7uKddBq78EahUJp0LpTTuUZkG7VlVGnuuvo59gi2b02l1MyLkfgS/geFrxPtY4gV+0P49CuwwqCtQdBJs55Q+B2ywitpsL5KP4hsXQVUVEJoKfT4yTzKHITJczQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2G3Eb5j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB1F1F00A3A;
	Fri, 12 Jun 2026 21:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301219;
	bh=WDQ95EfqyLPbWDsakv12KdYncIMOPQwzZ25ODfaKTlY=;
	h=From:To:Cc:Subject:Date;
	b=M2G3Eb5j5b31VcvQd6s3Ez5lH/KwSjUpzQmHYfpz09dRBw0WISg+pK6BTpqIlNznA
	 ljhpUqHYx35CuqaDb6Qlty2w8ElUt63Focl9cwo5DxmseBcFVN3HAOw4K3w1HgYPfG
	 xpIkl5nTTDEVrjzRolY9Kk2TeR7P88yNw2HV8e2sJGz+bu4M2YmX5MZlwiiyWkJDAH
	 +Ngzu1Lc4pTi3o5vEUYiqiHwdf4ZuRfPV8CZd6b6E01Q7k8vwSS+vDom2wkeGQ8CPf
	 ABKRMSGZ5J4ZNJjFIR13NYspO2uPEGpfP44OBu5lqynVoYZvCBWwxVaktEUhjAZ3nu
	 ycp7/us5HejPA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: tmp401: Read "ti,n-factor" as signed
Date: Fri, 12 Jun 2026 16:53:32 -0500
Message-ID: <20260612215332.1889497-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15078-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23C0267C9D5

The "ti,n-factor" binding and examples allow negative correction
values. Reading it as u32 makes the helper type disagree with the
documented signed value and hides real schema mismatches.

Use the signed helper so the DT access matches the s32 value stored by
the driver.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/hwmon/tmp401.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 07f596581c6e..22ff7c66dca0 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -560,7 +560,7 @@ static int tmp401_init_client(struct tmp401_data *data)
 			return ret;
 	}
 
-	ret = of_property_read_u32(data->client->dev.of_node, "ti,n-factor", &nfactor);
+	ret = of_property_read_s32(data->client->dev.of_node, "ti,n-factor", &nfactor);
 	if (!ret) {
 		if (data->kind == tmp401) {
 			dev_err(&data->client->dev, "ti,tmp401 does not support n-factor correction\n");
-- 
2.53.0


