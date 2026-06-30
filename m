Return-Path: <linux-hwmon+bounces-15509-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Izn8OhQuRGpcqAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15509-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 22:59:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACF86E7F6C
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 22:59:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b="eLmAu/rz";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15509-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15509-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866F0303E4CF
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 20:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E839F47CC63;
	Tue, 30 Jun 2026 20:58:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FC547B43E;
	Tue, 30 Jun 2026 20:58:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853083; cv=none; b=I987aheouRRDDA3KxD3nKbQ5fOmT/307fGapDxs3egr0VEFph5PdJcnhwHtyPWWIurWkG2gSp0LTXPkkfzZ1qe9NIZEcgT0zRgqH7uUgCgZWcLYRqLHEq39mAM34TBLbr4S5ToaJw+n2DYQC0yB9q1S5PAi5L71poGxMCJKg7SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853083; c=relaxed/simple;
	bh=4V+6SPb8wLL/ropxkrBPVp3VMCM0xDTdV7GXpVGXJ0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I6qmgfr/JuZsnbqMA39HcepM0jUJTzixd/CfRZ6mDuvnH3k1FrLj1aGMzG+SmPk5k0lalYJhM40gqCDb2+WhI+Sb6wkEDpXgd+jf17TQ3DPcZGRkkkyl/Yum+2L3YQqWI1Xz+NlmNjlpewiZj13Q/P2XSxMwynA8HlzFFDCi4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eLmAu/rz; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1782853080;
	bh=4V+6SPb8wLL/ropxkrBPVp3VMCM0xDTdV7GXpVGXJ0M=;
	h=From:Subject:Date:To:Cc:From;
	b=eLmAu/rzx6v2ekMTAbo/YN7uVA3tMN0ukoNz0PzZtRRcGRiG8ubbL3gAFnF3ouvVx
	 pVZ7L7f/8aov0vGxl4HS4q+7NxCF5Ewwv3xarYlng6Wfy1Q2bmIZGsBs7NvJejxFoD
	 nM7hyTyeyqnor9lB1EZltl7pPVCuEGfjTIS96JWY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] hwmon: (cros_ec) Rework the temperature conversions
Date: Tue, 30 Jun 2026 22:57:50 +0200
Message-Id: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wrCQAwFf6Xk2cC2i6X6KyKiadau6EaTXoTSf
 3fVPg7MmTODsUY22BczKI/RoqQM5aYA6s7pyhjbzFC5qna1d0gqdmLCbnpIQhlZw10mdL4pqdm
 6XRs85PFTOcT3L3w4/tmGy42p/9ZWQ/k15Md+1ZblAwvnJqGPAAAA
X-Change-ID: 20260630-cros_ec-hwmon-overflow-0381c8509df3
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853080; l=902;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=4V+6SPb8wLL/ropxkrBPVp3VMCM0xDTdV7GXpVGXJ0M=;
 b=WfEso0J9B5FSmqzYSgNViTKpXtXh2uzbjVgDyb9oQqVZU1+9ekAMJkCQtM60tE09BKS19N0jy
 9wN4C+MVxXyDi9NgPtxibAxOe8z58Z39v6ovpCso2Bf/PLvCLncByxA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15509-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@weissschuh.net,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ACF86E7F6C

Align the temperature conversion to the one inside the EC itself
to preserve nice round integer degree values.
Also handle overflows.

Patch 1 was originally part of [0], but I'll need more time for the new
functionality, and these patches are useful either way.

[0] https://lore.kernel.org/lkml/20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      hwmon: (cros_ec) Implement custom kelvin to celsius conversions
      hwmon: (cros_ec) Handle temperature conversion overflows

 drivers/hwmon/cros_ec_hwmon.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260630-cros_ec-hwmon-overflow-0381c8509df3

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


