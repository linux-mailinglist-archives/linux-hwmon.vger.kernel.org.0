Return-Path: <linux-hwmon+bounces-15368-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NkNsMCQrPmooAwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15368-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:32:52 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8C6CAF78
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:32:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HnvkfHcS;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15368-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15368-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB14F3011369
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17833D9020;
	Fri, 26 Jun 2026 07:32:50 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C536EA84;
	Fri, 26 Jun 2026 07:32:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459170; cv=none; b=SkIFSlTUeINmHs9xTWQBw2srSp7Ln0MlqMEfT8VPAaFLJTj6AivjM9N5EuwYMV7gQnTgVW9B/YscM2UjyCPiqkaLAhVc6WBGUw1pQ5+MLg0HlJ65h4ZShEYA1NnXsZ+kTFQj344ZuKgpZZiyL9Gjj01DkD6jhie4n4KhAeyDz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459170; c=relaxed/simple;
	bh=u0fPHrLYf9sLm0yYxI9gWkNou3+hcuvKtsbGuNTxgF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eGo1Mh2hjIhBf0HYET1TaU9QsoliiKjZkUQB8q1dHhyOft/FCLETVqyZPPbzTRIIA22G3yOVSFUiAgaadAW+/A/mM0uMF/vjts5PjFjZrrByzxOGInoGcHm1QEsYbSCYJMcQdfAvYwEO+Kv24TFfOVPJ4AHUhW1efJ0/HBxUxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnvkfHcS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1781F000E9;
	Fri, 26 Jun 2026 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459169;
	bh=u0fPHrLYf9sLm0yYxI9gWkNou3+hcuvKtsbGuNTxgF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HnvkfHcS8iZG8i5dQBxX4xVV9GHvc56YD6Zu+BivTWrbVc8YmGpkSyCfNo5MsLQfP
	 SF9NlJsAT87wLd83ljX6PgKqMO0Mhb5xe/vptNxIsCP1MVM1lE7kOVoYDRFhyPWVKj
	 PRzeUk5UzJwmpEggOZnCu/GEHOvLrXVlubM0s1I9i9+N/O2xQvlMTMhSagLdK4Jcob
	 hdOcOY8dgsQqJqHVuHk4OQz9gcFIuEztB242xwFFWjYU7IjoVJgw2NUymhWIsnmUVg
	 tFh1N/eSlgKCCTa+OHRNG9pNXdvuTa+TvFk1+eHOKuiCCBE4qya+hXE05vwcza4s15
	 I0GY+bnl7stjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] doc: adm1275: Add ROHM BD12790
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:32:48 +0000
Message-Id: <20260626073249.3F1781F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15368-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matti.vaittinen@linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AC8C6CAF78

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D8


