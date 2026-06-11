Return-Path: <linux-hwmon+bounces-15015-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T+mAKbtNKmqhmgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15015-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 07:55:07 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC366ED27
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 07:55:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PmMb5LQq;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15015-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15015-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C455830065D1
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 05:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4912FD1C2;
	Thu, 11 Jun 2026 05:55:04 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD832248A8
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:55:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157304; cv=none; b=XVSxoq8Ootlw25CPuRGQmNf/ExNoz5H0jjAiQZyJClPbzRBvvyoezyvOMlleW4stRG+aJVssIDBM3lFjQtW8hvT5RDKEzMkn7byQ2RFwg5tPG128d9kvjmjkV5+qfIpZ0NXGP6VMLgLNxREk9pV/KVpKDt+TPre8jMTgYjGSNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157304; c=relaxed/simple;
	bh=qnn7zj9qcWvOsX7tT9BOUqk5PpChpQ99NZvdjwgpMRg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZ5Aq8park6sRsZ05zqGELKqYY/SGNWwANn0Fk6KXuVtOo3WqJs+aL9OifT+T5+3iIipRUmzauHoFCFyJ9l9NIeDLEzL6NPRLhgOsnxYn4iQXNoAwWbbZVeecytLo/u+Dp9IhpAz+KIWZGNHmF7Mtn5x2do7aVnzxsSFro37uS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmMb5LQq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A331F00893;
	Thu, 11 Jun 2026 05:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157303;
	bh=qnn7zj9qcWvOsX7tT9BOUqk5PpChpQ99NZvdjwgpMRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PmMb5LQqE1U30MjjOppG+Pf+XDkHFudOoVvwt5fGTX9sBbvvcf2qg6rZB3Gcs3h4U
	 v2kKqlTXaOFdLbBhsmOn8qEL+4I+U6p+Vyozi15VZZGpXoFGX7l8HnQb+JqfnklFcY
	 RxwXHOwnbCEj1yMOTMuUsbRhB/gSnPQnYlgUW/RfOV5HUzBkcusl0IVO1xqD7NLbW4
	 HBmS5scKr3nl8O5dtFRZwU17oBy6zTJqSGO9GLIgoY3J+5gz/zWzpuA1CvRJtKdm2c
	 1IhRdrBVMOuI2QxTzAo5nR9ahTi8GVIiQwLIQTDk+9jFcmNWt/pkbCjizvedCumsrs
	 T4WYU4LqsZmkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>
References: <20260611-lm25066-driver-fix-v3-1-9d7d4b4e253d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:55:02 +0000
Message-Id: <20260611055503.34A331F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15015-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:linux-hwmon@vger.kernel.org,m:potinlaipt@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39BC366ED27

> Swap the high setting and low setting coefficients in the lm25066_coeff
> table for LM5064, LM5066, and LM5066i. The coefficients were previously
> mapped incorrectly, resulting in inverted current and power scaling.
>=20
> Additionally, dynamically assign the exponent (R) registers inside the
> probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
> exponent is applied (e.g., for LM25056, high setting power exponent
> is -4, but low setting power exponent is -3).
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-lm25066-dr=
iver-fix-v3-1-9d7d4b4e253d@gmail.com?part=3D1


