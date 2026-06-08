Return-Path: <linux-hwmon+bounces-14856-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SFgvAFaZJmrXZQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14856-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 12:28:38 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA865513E
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 12:28:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=McJ+j5bB;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14856-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14856-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202D23037D73
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 10:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3B83B895F;
	Mon,  8 Jun 2026 10:17:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2F3B7B84
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 10:17:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913852; cv=pass; b=iF/GFd2qNqaFmo8MGKa0S7pbOh2wbZZU+T6QdJR+qB1ystcMFldm9dhUe0KVC3+e6zezuGhcrbSfLOoGMY5FoapcvdK7ebLtfdDr8UA+TgZZuSXumUOHRSeitBbCcShdZEv/JwHb5uQ+eqv1mzbZEdRLMag78930A95LOhLIS5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913852; c=relaxed/simple;
	bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzv9/2XToWEx30tw1uQ2eMQ9qDhO5Igy51B6+V1zFL/jh8KNOMBqfdLqFZfMzMPe8OQFT0HIdM19RO03foytazY9wmZrelOzTB1VW6M4p7NAbkaDc+LVqbF2Qxsih9shmTlxMXl9fQ16Zp2O5awbRdNCYlVBVpFa6I5v3rF8Ls4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McJ+j5bB; arc=pass smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso7287878eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 03:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780913851; cv=none;
        d=google.com; s=arc-20240605;
        b=JrnToMcTVFNbhnLmWzhqMCBlZatvowJKRilhuuQzJvnXbP7NZj418SJndu4mg8RDN3
         i3PcVdNx9mqOE+e1mfZSoog71+Dvmx0d5ReXnjYo80tAzzr2dHMi/Io7nV9PJqTdivLn
         WtibeK8XoCFpAbs3dcgPh1VHIu3tEEw8xpe/QK6cOP4zg4dT5YHLRLtc6yKdcOWAdpEp
         iRrWcOJgJJsY+h07DaIYiSVRcnKpSwfr+Wxgi6TMRLB4w6wQopZTSA7NwC8PtzsoTAWb
         1pEWXATmYH4sw9acbmj4KMDAj7HAsjfpsJxwQb2hgE/DkGf0Bh9CEM+50zboqeIxMKO0
         3J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
        fh=4i2oj7kEL+13TWxYucHVt6eD0CvNTAraPEcrTNsM8x0=;
        b=X/KLEXTJdbkJo15gF48th6isLizquOMv+NhY7FFbVija9ubU0FgXV9tP0b03/4n3mW
         7N9QlyhCVM3wopzcmkcuRA8AKlzN6bY7euaORgqX4o5UhNpbTqPieoGuvXj80co6pjSA
         Q/NqjTzs+xjt8pBQ6vF0wnQgukG/JUCB8ySJxTksliUVh8NB1CBb1RR0ZKlHHdQ6zUuX
         /ie1DOka2kWUMUFkVY8KGyaR0tur5VBZR9FEI1Z6vvVm3RpWpYf3shy+DhseRCAOl5d6
         7Mz1ibP38HfD0oqIy/EjrSnlUzot2wlcQUQklp+B14g02mZLztO3pzzSkJynhAbyIHRs
         Uwjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913851; x=1781518651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
        b=McJ+j5bB93qV60Xd6jL7CB2h0Tol0NTSAwnLQ1NVq7yej0qLYH710QSfrQApf08J+L
         1MWg4Rfic7XZeP9a4/UH/0ITATYISgaoBfer2glZ8JDQBTpx4X38U54yrO8r4zmJvX1i
         mBZIW0jc6EBLRfJCZG8wGqcA1UmsiXLKGNt2Iz+3K6fd8wWSx7YW8T/qimBSZEarF0PB
         KaLD3/K+mHqHov0qv77ZJyOqd55j3WQhjqoks6/je5ppop1NLByGVNQkqIb8Nc0bY52W
         18r1+OgUkNxfGSgut8B6X3INN/4I+OvfEZjhx902EGD5MvJMfTX/09JZvn99hkksxeLq
         HiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913851; x=1781518651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iO1eaGvDzXfIATQ6FbttFqSUgNHzC5DEYjmEOl/H3DI=;
        b=Jby+lzHGcIkiIhpukOleeZ85vZGIFopKZHbPltqS0krjoMNXOPMmNmOKJfvaoJf3L/
         E6hk7Wkg1lco5e+leHBEjTSXm0NoZyDB7lPruu4YqybBZwcM9Y23ZICgu2kIaW8BXj6b
         wjBm6U361NYXueYyNoofN0X3mRcxDCAOBUf5VsSvXD1sY3CuOA9Zywx38V2fdlD/hzIO
         D5GHvvnUB4ce4J0Hb7RbpJigh7Jyjh3OzbJtJL8RFNg3IwLkedBVEhNvE5rhpsITFXgI
         cVqHa8W9MT8pGbFx1+v3UFvw++EYuBkI2i9OwLepW5Lv+EiMnQ9Bfi+zJagD3zoq+Niq
         q/RA==
X-Forwarded-Encrypted: i=1; AFNElJ8yASqtEWEnnBGrL8WVNBgJYTUXpxyOgLbCCirv5JBOkC4t/GMgfcKPi7axvHC/v2nnKZQeiw7uy88hSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0zq+L5XH1luEyn976zsA2CxFkS6IuJGwgO9MA08dL8X+IgmQ
	ALazIZkGU3AyTECyZkuTFaT2vlM4t7+AB3VuMv58iRo3FuEzsEAZtcUiuc4WQSl2dZJS8oR3Hm8
	ryT/076xkMvO/CklKIHTPeFhQ+qwoC1o=
X-Gm-Gg: Acq92OGFOV8836jmX8YCqrlATUSdVQO+kfJ0uK+6yZjrs1LpW2t0+ntyECVsv18aLdx
	Z683hgMO23KVtQVMjya6hdoSPrxpZQN+PSGMv+/rELvuigOWxa5meYim8bThGq/FnIhDDtecDoU
	kkoYJ7tHgd0JyyXP9UVyX27a3SSRIh9fmV3rdzLCWQIFiySavcUSBsU9tif0OIzrErnhMdPPNqO
	m1uf3xT5hsSZqHdy2akfllanGmQIhaudFBEQjw7bLxPc0Y93Vvfd243wGPqN+dgdVB0165yPdDY
	vd/dGUpcsrkla29YTek=
X-Received: by 2002:a05:693c:3b04:b0:2dd:c066:bf7 with SMTP id
 5a478bee46e88-3077af4c792mr8284449eec.11.1780913850572; Mon, 08 Jun 2026
 03:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603141033.111300-1-clamor95@gmail.com> <20260603141033.111300-2-clamor95@gmail.com>
 <a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net>
In-Reply-To: <a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 8 Jun 2026 13:17:18 +0300
X-Gm-Features: AVVi8CcrOQOubOdj9JOPPyVint1e3zMXjsL7b6vwNttA87TuPIhuEKabhXB-TLQ
Message-ID: <CAPVz0n2CZQZSpcdCTD3oPJS3qZVRkktwcNnMgBfmAoHJJMvJ2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14856-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:jdelvare@suse.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67AA865513E

=D0=BF=D0=BD, 8 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 02:03=
 Guenter Roeck <linux@roeck-us.net> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 6/3/26 07:10, Svyatoslav Ryhel wrote:
> > Document SMSC (now Microchip) EMC1402/1403/1404/1428 thermal sensors.
> >
>
> This set of chips will need a separate bindings file. The EMC chips
> support several configuration registers (beta configuration, ideality
> factor, consecutive alerts, filter control, just to name a few) which
> are not supported by LM90 and compatible chips. On top of that, the
> EMC series supports up to 8 channels. LM90 compatible chips typically
> support two channels and never more than three.
>
> Claiming "compatibility" with lm90 for the EMC chips is simply not
> appropriate.
>

Since you have such a deep understanding of EMC sensors, perhaps you
could submit a proper conversion of this driver to support OF and
regulators yourself? That way, we can avoid wasting your precious time
with lower-quality patchsets.

> Guenter
>

