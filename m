Return-Path: <linux-hwmon+bounces-11366-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IgNF5H1cGmgbAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11366-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 16:49:37 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A725975B
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 16:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 305A07A6F67
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 15:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4344C901F;
	Wed, 21 Jan 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="diXNSY/k"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com [3.72.182.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C3315D33;
	Wed, 21 Jan 2026 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.72.182.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008818; cv=none; b=WGz+C65q6bWV7HA6CrLgQCTLglULNTVurZDtLTr1ISWwnP1qNFh1tbhJzsUaKsHMhtCl7Tq0EzscmGp/22m1wxQYUL4C6h8e6HaF6ElrfvtadDS/4iFGjHSj0HOl5vRFu4fozvyWVMaod3KrRfhEguMKMJmLf+9TVc3FEKKuucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008818; c=relaxed/simple;
	bh=+SbmgMmVum9XSbJIKf/AxivKorcImnU8EHgEdooZs0Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkLcshm0zVRQhShE/3ryR9Jj4k+M3znwh/Nnxj1GubEc7zErVp3D9vHKqOVS0P4U8PgSeUSOzHYVPGQyCTa4z3fP3cazVG3APzffH1ZBrFibMgPyi+j1xa0nTWr7tUA0/i1TGAksF+/ozSo7uh3vDQJCkrFClMuzbzRaWUltveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=diXNSY/k; arc=none smtp.client-ip=3.72.182.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1769008816; x=1800544816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2hVXaLMhD7VhTtzESPV+Av42+eCg/k9S4Zfl5fPqZZg=;
  b=diXNSY/kfMJkfeOQCJ044erz9OOlAvsChodUB9v082yEM85Van0tSYgI
   6yiNIQqifDE/W5a3caF1QPjOStHs+ABJ/ZhtAVlEp66IOKhAz4sN3pnHR
   Rr94rEhDJiEE3vD/Ui5apIB2/cNZkgGhN2ESXQVLBAh2Ap3/aPOFPWyhM
   s4M19AyoRi6ZoAroaYsfiPgqbYnQc+AOZG0/ON8sSNbwzHkvW+oldPvS7
   iUghBZEO7J1y3Ubk0Mpd9GoSFVDpp19u5UmIT0nymltzkwMFETD20KXWV
   59i0RM6r6UmOP4Vn1ubNj9j+o8PVA8l2vzazrWB90bUhTkAnJ9cIZgeNb
   Q==;
X-CSE-ConnectionGUID: zcFyLJDTRGyL6X+ZX95k2w==
X-CSE-MsgGUID: Tj+WbDShRwGRr5UjeOIHuA==
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208";a="8237904"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:19:58 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:16851]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.37.86:2525] with esmtp (Farcaster)
 id 83ca86c5-b17c-4159-9515-c900dd846a3d; Wed, 21 Jan 2026 15:19:58 +0000 (UTC)
X-Farcaster-Flow-ID: 83ca86c5-b17c-4159-9515-c900dd846a3d
Received: from EX19D003EUB004.ant.amazon.com (10.252.51.121) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 21 Jan 2026 15:19:57 +0000
Received: from dev-dsk-almogbs-1b-998410db.eu-west-1.amazon.com
 (172.19.74.107) by EX19D003EUB004.ant.amazon.com (10.252.51.121) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 21 Jan 2026
 15:19:54 +0000
From: Almog Ben Shaul <almogbs@amazon.com>
To: <linux-hwmon@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <itamark@amazon.com>, <talel@amazon.com>,
	<farbere@amazon.com>, <ayalstei@amazon.com>, <dwmw@amazon.com>,
	<almogbs@amazon.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add jedec,pmic50x0
Date: Wed, 21 Jan 2026 15:19:46 +0000
Message-ID: <20260121151947.37719-2-almogbs@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121151947.37719-1-almogbs@amazon.com>
References: <20260121151947.37719-1-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D003EUB004.ant.amazon.com (10.252.51.121)
X-Spamd-Result: default: False [-7.46 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[amazon.com,quarantine];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11366-lists,linux-hwmon=lfdr.de];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[almogbs@amazon.com,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jedec.org:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-hwmon];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01A725975B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree binding for JEDEC PMIC50x0 compliant I2C DDR5 PMICs.
https://www.jedec.org/standards-documents/docs/jesd301-1a03

Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..fb16bd91c76c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -171,6 +171,8 @@ properties:
           - isil,isl76682
             # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
           - jedec,spd5118
+            # JEDEC PMIC50X0 DDR5 Power Management ICs
+          - jedec,pmic50x0
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # 5 Bit Programmable, Pulse-Width Modulator
-- 
2.47.3


