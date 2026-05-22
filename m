Return-Path: <linux-hwmon+bounces-14433-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ3FBeGkEGqYbwYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14433-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 20:48:01 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 840375B926A
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 20:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D220C30088BE
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 18:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13373451B3;
	Fri, 22 May 2026 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b="vQBBrQiS"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E53537FF
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779475676; cv=none; b=ZGeqrpxOxxs053PvZPnen3H+gKCyYJuZchxhhz8YWdoEqgvpSkS403U59xuiNY01UK5GAwvVRSmG2Q8UUSmQCQsBnPmC4Z0nV6Zp4nRdoGA2Psd+OoRRFni3rQFdlFiGGad+n6ldLaphoFo3WopBCfDGtqVWJosoq+xqzI2aaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779475676; c=relaxed/simple;
	bh=gO7v/rYv2SJW3xZT+IUi+JDTFsflFGgbFwdGKEt/4YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gqum6DsLkdkEyS+vsUfyDBhYw1CP55Z/U3SRmx4fjuwe7NaTUkDRjD+vZuuHHJaZ/xbmZOb4PWhul2VEbNIhh13ymlsawVpIg2nuEe2EzOx7wAHuQpRmTUXdC9rg9KOqo0gi9fzx9l7vAG04P6n836G/4CJUuD+MvcEMpM69cLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de; spf=pass smtp.mailfrom=jhbruhn.de; dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b=vQBBrQiS; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jhbruhn.de
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 64FC117F9BC
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 20:47:52 +0200 (CEST)
Received: (qmail 4592 invoked by uid 990); 22 May 2026 18:47:52 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by boethin.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 22 May 2026 20:47:52 +0200
From: Jan-Henrik Bruhn <kernel@jhbruhn.de>
To: sashiko-bot@kernel.org
Cc: kernel@jhbruhn.de,
	linux-hwmon@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable
Date: Fri, 22 May 2026 20:47:48 +0200
Message-ID: <20260522184748.3104415-1-kernel@jhbruhn.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260522142850.E67A01F000E9@smtp.kernel.org>
References: <20260522142850.E67A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.822638) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.422638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=jhbruhn.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=gO7v/rYv2SJW3xZT+IUi+JDTFsflFGgbFwdGKEt/4YA=;
	b=vQBBrQiS7jkloCpTQ4BD0ooSeTUFREAd1RmPjqV1ruFA+4fYVXbJwHm47vuIl4vD+mt7B869RE
	KLKQPtosDDElX3Xt+jMOG4ZSrreMsMSHgVI0b8m0UxBImJVer5pQ4TZJgJFtpm0vELw9DdapL02Q
	JPAaDsLEWFqXsoJq6barLNUduPrIxygWfqduUYapZnj8v8cZpcBJKPNWKRAH1Y9oxzX/aXIjjPtF
	pgQf1DXKenUoA+6Ea/HQk1dVEuvPV0Qe2YZr5riXUd1Z+fQQtLoIKsDWNlRWW22HWly5DLd8dDY/
	IzPV6N+2srr9A3qbvbj9g4WYeI9qy0IBQJij8qXHc4WPb0+bzSTcP5p7R+hqOlV9sMQxVi9/XLuN
	d/uep3Wz37Woa794DuxCbUh61H8dh02K1bXruLQjC+/JatdDnvU2g8NPXe+DQGRLYBDcNNq+6PVS
	94ldrUPlsuqnNI9LiaEECwz+F1K8vt9IRBWWpK87PyTu97UUCXqzADDMXavg5Ocdje+emMhnVheR
	HpCE/EHdSc9g4m1nJ4gfnt75meSnjg2ukk1ja2ysNSJwMo5G6YW+TVRbWXRboIPBZZW4F5pFwGMZ
	lNZnadDjxlWlphfVg+2uulOSkhDZJLjDDI3bgEcNl6lDDK7uKsyalyzPDIQaZ2Wi/0mfXk/3+nUv
	k=
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[jhbruhn.de:s=uberspace];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jhbruhn.de:+];
	TAGGED_FROM(0.00)[bounces-14433-lists,linux-hwmon=lfdr.de];
	DMARC_NA(0.00)[jhbruhn.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@jhbruhn.de,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 840375B926A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Does this code handle I2C read failures correctly?

It does not, but none of the code in this driver does.
 
> Can this read also fail and silently truncate a negative error code to an
> 8-bit unsigned variable?

Same here - judging on the existing code, hardware failure cases are out of
scope for this driver if it has already successfully initialized.

