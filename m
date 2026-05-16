Return-Path: <linux-hwmon+bounces-14182-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id raaFAUhYCGqykQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14182-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 13:43:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22A55B823
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 13:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 530C6300D33D
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 11:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEFC3D3CFF;
	Sat, 16 May 2026 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYoE4FYg"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53180381B0A
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931780; cv=none; b=F9ixdTiTndScQmzGr4YtOnSrTYvh02yXFxZpmS3VtZaNOtCu9Y6HPGugzznz2TWwQIm/81FL0SiDyjnZpIgfgnO8ps1Z13fH3NwuVdQpW4S8NrwTWODEa8HxPSAqmpxbhkOstr5NYp9qxVN9XoErJSDwxteCmcIJ8DJzvHsMU/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931780; c=relaxed/simple;
	bh=n7XtjXnry70fkSHDjvfqQUUz1JRBCj5MMvXXcDvY5cE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7BtRuvF4pz5O+mvFqx54N92EZN/bT4A9FxFDP9z250RsCpnbVa6elsHNKymxqMo6v7qOjaQ/FYQWOf+ALvhC3wEP5vhxGm7+WqZjlhmcjKyTm2Dit91w8oCW+PEmBo7twFqcW8SfjpueFIbzxbrXGLtoAT9nOu5PmCpGCjRisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYoE4FYg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43eb05b1875so261209f8f.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 04:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778931777; x=1779536577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRXhWx6cXZhJbhxep6J+/u3yZuUqWY1CFN2s2nxmM/Q=;
        b=EYoE4FYgL89RLJ0D86dZRcsJo1fWgbMIYzG5fnodFITiunBXyVT08O0+1pjFb8uGen
         0TkwsTCOZRoS+aE+7aQGMtsdw93aQB07YobL6R/8jhpe3XT6+xBBfpbnoRk9gKO1F2ok
         uynF9DFa1lItg+J3pNZSIFrfjnCOA2MYBYFFqjVxMRwLssXJ8qchbBr0dzJVd0ByfALT
         nJ/KY+hZzhjXtXn3Nc13PpnkSesmUY+t1qfPNN48dHOp4I8BELGwy+Q9nJLgKEN4D+7f
         Clyywgt62/IXCR2mKBB6A0QbON9kJSVTnqaXi+IJMMFsHZOGcyF4Ad3HnFzeyi0C+e5/
         A9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931777; x=1779536577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRXhWx6cXZhJbhxep6J+/u3yZuUqWY1CFN2s2nxmM/Q=;
        b=jmggJ5eTiaydoFZYVmrCMArMVwMWVJ6X7qcjvrcCZf/GW0W9i4tlO6wrbzmAKcMbzy
         23Twfn3ejgTLA0LAR83JqwBltp4S7DOY4RHfyAEtCGUNt1JWILzM9zXlpwRM/0lEnwzm
         S+CgkB1bh8siQBt10PflZLRr4yWNNeP1FmXuZNCJsgmGofkEkdrVyBuv2ME1cnxOJ5Of
         zWHCu1sE6HBaH8xAGpanUeAG1dqd+aelHkXCJe7mZFalFAm/aZylgoPaIDom7OFlLBTb
         G/TJa/GZ8lHlKHYJA/ID2uYc3QCAqyCiJmxgiAEiy+vJNbcQAfEWKqoE0GRqBu0X0Tvx
         WXCg==
X-Gm-Message-State: AOJu0YxgHNs2xq2etEh7t8N3dA1SVPkGn1tfNaSUSYo0C9REIcZycSbQ
	+cZbvwdjwM6fMBFO+wkQe/GMKkKrGoIK2A7jG6GCeIwHn4CpKML9Wq+e7/Tj4vyR
X-Gm-Gg: Acq92OGKJxqqoUX4s4TF5LHFS5fGfOgpIhNCxTzlwrA9Q72F5jUOSSLBIUBnvWioeZy
	lJtBS9HVFr0YqD1lE7IjAM0gkHO9WsbsegoCiiOaCG85qZ11CnFPQC4U9etxd6TxPOfVnlAcPpI
	FjHEeyPpSV2zBlC9MLbSEjQ6t1Zq8NuU+OPaWgSsFSTNwpclIx1g1EZJQb/qVwdlJJyOdOLMdgo
	Z+xLd8Dp8tCE8hZFxy0EG0hE1tYwsM75gIpxU6OdFs9xq1FySz45MhzHdeqnPSYATnLtyCUJUJc
	o/M8JiexInDkbOx4J+74gVdts0ZdKfozL9uD3W5iwcC88I3mX7Bz6Zi8DeF67aScH9WoQ9GeOIp
	R4mXO+/P36PctoYsAFBThYp/63X/ekarXuakFkxeQ3XyMkt0zwE4dNOZmpGewIunz3gzON5cAgB
	55+CCgHE+rmBG53pu4yevVT19QlgtoMnnND9xqLR5H4kGV8nU+Gtdux/uK+nbiVRIT23sLscdhB
	IU+bTeHjf+Oig==
X-Received: by 2002:a05:6000:4007:b0:456:ba09:3e64 with SMTP id ffacd0b85a97d-45e5c5b3669mr10613370f8f.1.1778931777335;
        Sat, 16 May 2026 04:42:57 -0700 (PDT)
Received: from arch (mm-28-201-122-178.mgts.dynamic.pppoe.byfly.by. [178.122.201.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e6a135f0csm3914941f8f.27.2026.05.16.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:42:57 -0700 (PDT)
From: bakshansky.lists@gmail.com
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	Roman Bakshansky <bakshansky.lists@gmail.com>
Subject: [PATCH 0/2] hwmon: (coretemp) replace hardcoded core count and fix style issues
Date: Sat, 16 May 2026 14:42:51 +0300
Message-ID: <20260516114253.5466-1-bakshansky.lists@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4B22A55B823
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14182-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bakshanskylists@gmail.com,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Roman Bakshansky <bakshansky.lists@gmail.com>

This series addresses a long-standing TODO in the coretemp driver by
replacing the hardcoded NUM_REAL_CORES with a dynamic per-package core
count. The second patch cleans up a few coding style warnings.

Roman Bakshansky (2):
  hwmon: (coretemp) replace hardcoded core count with dynamic value
  hwmon: (coretemp) fix coding style issues

 drivers/hwmon/coretemp.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

--
2.53.0


