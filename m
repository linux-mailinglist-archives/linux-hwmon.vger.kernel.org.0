Return-Path: <linux-hwmon+bounces-13088-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AUDEqlM0WnsHQcAu9opvQ
	(envelope-from <linux-hwmon+bounces-13088-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 04 Apr 2026 19:38:49 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330639BFB6
	for <lists+linux-hwmon@lfdr.de>; Sat, 04 Apr 2026 19:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E5553004612
	for <lists+linux-hwmon@lfdr.de>; Sat,  4 Apr 2026 17:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22977322533;
	Sat,  4 Apr 2026 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA+Ahrlx"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6E2EC08C
	for <linux-hwmon@vger.kernel.org>; Sat,  4 Apr 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775324322; cv=none; b=T7NBHQJVhHea2Qi4zLhN2GmTFZJE71748Zqa37CVugG4d7y3lMUnfaZl/Z6o/LP6smXP+2XfPmg0RL4hcM+pMdomElaqCbpGwtnbfrH5ZfpOYrb/BMrteUfmVB/Sklm7uanx+8wbokhUfh17FMyRCWqc1qfoqOlfqQ0ezKQ7jT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775324322; c=relaxed/simple;
	bh=FX4Z2qllfB1r2VVn5YsIo0pK3FbxmjkNeKpzY3zheAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHFg9ZRxJelONBV6gIj90sBrb703qZ1wVKAUYLOa09E91VdG1bzDlFrV6wD0IthAXxAsNwZoJuqibhSQ4+y4XNpWNRtsAc9sZG1hLFfdC1MyckGfmJWcJQyQGMO5q8mTRwHFAFsF3Q2jblcUrkcCIbCELXGdLLJGHXmpBIQo/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iA+Ahrlx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBB6C2BCAF
	for <linux-hwmon@vger.kernel.org>; Sat,  4 Apr 2026 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775324321;
	bh=FX4Z2qllfB1r2VVn5YsIo0pK3FbxmjkNeKpzY3zheAs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iA+Ahrlxpfen1P4KJI9V9BJD0BCfhnjPT5bbLSrzpmn+bhuddY3Re1zqqmrmX5AbS
	 JIf2OidhEg6MiyHTUZPQG+9zad+1ebHEFRyS/zjkqHz3cj/frphhHKntrsp4flk5li
	 3gaXWq71L2hGXneizRGu5/3vFPDGZEjmqKltA6ZsUTS1478EoHD189vVkditqH3D1D
	 55lF+1+lktwd8GLCX5YjuBZiQ4UDkW7MX8Rj/TcWWfBTv2FOnfJ5p60uWlQSm80q44
	 R2nZA6MkIx25B5GGvhTBpRviB/lZCJXggJsH38bRvCrjT1DggztZyT5h7vSvzA3ckW
	 9Rpkotn/O/TeQ==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so1842406fac.2
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Apr 2026 10:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaw/F99IWw1vzO/hZLe20cXb3+sultDLvizxTn4UwXmFV6LKCceymoAaeOgWnGiVP1gu4a2RhDGIwHQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LrMVEyqfF5J6N7OWcK6IeD8IwYx+KBBU+PEubI6WKZl/apfo
	UfZgzMItK8Pl1rM+Gv/h5dMdSnXB1eJC5lp7a65AhhAsAvpwWX7KVYiH7yx9Dy8pDT+Q8Mi7d6Y
	T76hUsO08v3p1OZk69AkCTwp7FRE8OZk=
X-Received: by 2002:a05:6870:ecaa:b0:409:60ad:2b1e with SMTP id
 586e51a60fabf-4230fd8dcf6mr3992942fac.18.1775324320689; Sat, 04 Apr 2026
 10:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402022742.17738-1-liujiajia@kylinos.cn> <2432224.ElGaqSPkdT@rafael.j.wysocki>
 <ebdbe040-d673-47b9-a6c9-f0fefc0b771b@roeck-us.net> <CAJZ5v0jZPXC5g3KY+trwmV=nXJu74y=0LaQTHaQ_MnqcfPVAGQ@mail.gmail.com>
 <ec16fc75-c5fa-4ff9-bc6b-91464e9c26cc@roeck-us.net>
In-Reply-To: <ec16fc75-c5fa-4ff9-bc6b-91464e9c26cc@roeck-us.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 4 Apr 2026 19:38:28 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g83UQKRcZ+u5EM13gwzktMXAxLqqcCoT8+CQLzOnChiw@mail.gmail.com>
X-Gm-Features: AQROBzBojfp3AH1kdkk2-0lz0_wj1zB73NdRqpcXldp_HprIvUZyt84cLdq6HJA
Message-ID: <CAJZ5v0g83UQKRcZ+u5EM13gwzktMXAxLqqcCoT8+CQLzOnChiw@mail.gmail.com>
Subject: Re: [PATCH RESEND v1] thermal: core: fix blocking in unregistering zone
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jiajia Liu <liujiajia@kylinos.cn>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Armin Wolf <w_armin@gmx.de>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[kernel.org,kylinos.cn,intel.com,arm.com,vger.kernel.org,gmx.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13088-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4330639BFB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 4, 2026 at 4:02=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/4/26 05:58, Rafael J. Wysocki wrote:
> > On Fri, Apr 3, 2026 at 4:20=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 4/3/26 05:52, Rafael J. Wysocki wrote:
> >> .[ ... ]
> >>> It appears to work for me, but I'm not sure if having multiple hwmon =
class
> >>> devices with the same value in the name attribute is fine.
> >>
> >> Like this ?
> >>
> >> $ cd /sys/class/hwmon
> >> $ grep . */name
> >> hwmon0/name:r8169_0_c00:00
> >> hwmon1/name:nvme
> >> hwmon2/name:nvme
> >> hwmon3/name:nct6687
> >> hwmon4/name:k10temp
> >> hwmon5/name:spd5118
> >> hwmon6/name:spd5118
> >> hwmon7/name:spd5118
> >> hwmon8/name:spd5118
> >> hwmon9/name:mt7921_phy0
> >
> > Yes.
> >
> >> Names such as "r8169_0_c00:00" and "mt7921_phy0" are actually overkill
> >> since the "sensors" command makes it
> >>
> >> r8169_0_c00:00-mdio-0
> >> Adapter: MDIO adapter
> >> temp1:        +36.0=C2=B0C  (high =3D +120.0=C2=B0C)
> >>
> >> mt7921_phy0-pci-0d00
> >> Adapter: PCI adapter
> >> temp1:        +30.0=C2=B0C
> >>
> >> essentially duplicating the device index.
> >
> > Well, with the patch posted by me, the output of sensors from a test
> > system looks like this:
> >
> > acpitz-acpi-0
> > Adapter: ACPI interface
> > temp1:        +16.8=C2=B0C
> >
> > pch_cannonlake-virtual-0
> > Adapter: Virtual device
> > temp1:        +33.0=C2=B0C
> >
> > acpitz-acpi-0
> > Adapter: ACPI interface
> > temp1:        +27.8=C2=B0C
> >
> > (some further data excluded), which is kind of confusing (note the
> > duplicate acpitz-acpi-0 entries with different values of temp1).
> >
>
> Yes, agreed, that is confusing. I would have expected the second one
> to be identified as "acpitz-acpi-1". Do they both have the same parent ?

No, they don't.

The parent of each of them is a thermal zone device and both parents
have the same "type" value.

> > That could be disambiguated by concatenating the thermal zone ID
> > (possibly after a '_') to the name.  Or the "temp*" things for thermal
> > zones of the same type could carry different numbers.
> >
> > A less attractive alternative would be to register a special virtual
> > device serving as a parent for all hwmon interfaces registered
> > automatically for thermal zones.
>
> If they all have the same parent, technically it should be a single
> hwmon device with multiple sensors, as in:
>
> acpitz-acpi-0
> Adapter: ACPI interface
> temp1:        +16.8=C2=B0C
> temp2:        +27.8=C2=B0C

So somebody tried to make it look like that by registering hwmon
interfaces for all of the thermal zones of the same type under one of
them, but that (quite obviously) doesn't work.

