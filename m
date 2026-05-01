Return-Path: <linux-hwmon+bounces-13688-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULhLGqeh9Gn4CwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13688-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 14:50:47 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DBD4AC7E5
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 14:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3493301906D
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 May 2026 12:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AB33A5455;
	Fri,  1 May 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwgeOSwN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDBF3A5420
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777639843; cv=none; b=cNt6OR6bw31gF8SBVxtwjPjekBCVXbUf4sRLSnvLhdiDNMt9FuV7KvQQscmSebyUgEE2CLmtgoXpL607fHwNL5jXK8bBlzDkVTfWh0PRHjv/JHcbcOMXF0yX8+9qSY2e8nDvfUoYRqvVaKFDrchII4lDF8JyW/KRPPh6XeyeZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777639843; c=relaxed/simple;
	bh=6d+XYNzObxNK8kcRL+W7Rn3x9wh/i7CXg3NyKQjNICg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOs0tq4me+k7lVPa9HbsSJIMyha+8QXUOx952kbn4PMdLAsty58ypLeuRRICoppskjontb5R/JGZraG+oUzzN5nvqjNh4vANaVIbDHROGoCusU4RxPLIwGZAilxvc9Dm3kzfnL/KLNSeM+UxClMdkkRgfqhKF4qTMFvWAWY9rMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwgeOSwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2196DC2BCFB
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777639843;
	bh=6d+XYNzObxNK8kcRL+W7Rn3x9wh/i7CXg3NyKQjNICg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WwgeOSwNzsj29WDtcE1mS/HSpqxDm49Ki6Wh35yYgu2sMY1jdMvP7YPGuHCCFg0QK
	 psshTmr9gecrnfFazEd8xpfKMYuA8aB3l8IZhzfjnhClinJVlCqcsX4tngGxSQpWsP
	 MwxEhKDD95+OOJRWeWE3/FjkHjUzqKNG5kwCwj0UdrTqP97cI4P5FLGql813h6mMKu
	 HnbElXEGV3CjXwEqsXplw2kSzLk6v3CIqiIzTijj3jkJgaoLcwktJ6YOwmyWZHhuH3
	 3mtCZj5zwq3xgVEAeJLvRV6Rdsu5uxQ2W9IV2rt7zlOhsfcSsII8fUS/uaN6kUhVq+
	 SYltRbsLQAHzQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so2410902e87.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 05:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+0VvqzNtR/TwirU7ayGLBw/K05gmojO7Ixn+gVUzIRbnrXTBSnVYJOfGkO0Uos9lZG1guPm1GhycbrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSwc37ePD8bBntHRoUg40EAWxukaEXqPzIy2XL85BXf9ZgS2x
	Ynb//rdSF54UXwoxLsks7s8Vs8O8iTjUIpECS66k4F2EoWbe5/X0rANvZFetDVNVbYBuyVbJ9LT
	/4DBoe7XnkJbKd3+NAFEiaZiWsiCnW2g=
X-Received: by 2002:a05:6512:1195:b0:5a4:496:5b9d with SMTP id
 2adb3069b0e04-5a8522dbc58mr2709876e87.33.1777639841084; Fri, 01 May 2026
 05:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
 <20260429161430.3802970-4-daniel.lezcano@oss.qualcomm.com> <CAJZ5v0jTbOkR8Odok2Cq6iWHGRzkF56spHr2xp_M8Zayg6ZAfA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jTbOkR8Odok2Cq6iWHGRzkF56spHr2xp_M8Zayg6ZAfA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 1 May 2026 14:50:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ikmPwRq6ykwCH=Qi7Z477sTktm5dRU721Ye6+qQKs2Dw@mail.gmail.com>
X-Gm-Features: AVHnY4Is75lcHeqjktPD_iG7LrS1UJOnFheEfGOLNioGrZD80RF0qAgXlsmF7fE
Message-ID: <CAJZ5v0ikmPwRq6ykwCH=Qi7Z477sTktm5dRU721Ye6+qQKs2Dw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] thermal/of: Move the node pointer assignation in
 the OF code file
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: daniel.lezcano@kernel.org, gaurav.kohli@oss.qualcomm.com, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 08DBD4AC7E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13688-lists,linux-hwmon=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,intel.com,arm.com,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,etnaviv];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 10:12=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> On Wed, Apr 29, 2026 at 6:14=E2=80=AFPM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
> >
> > The node pointer being assigned to the cooling device structure is an
> > action done by the thermal OF only and does not belong to the core
> > framework code. Move the node pointer assignation in the thermal OF
> > code. Consequently, the devm_thermal_of_cooling_device_register() can
> > call its non-devm version resulting in a more intuitive design of the
> > API.
>
> I wouldn't make this change.
>
> It adds overhead to the OF case that's not really necessary and
> complicates the code just to avoid using struct device_node pointers
> in the core and I'm not really convinced that passing a function
> pointer to __thermal_cooling_device_register() is so much better.

I would start with splitting __thermal_cooling_device_register() so
that it becomes (sorry for the white space breakage induced by GMail)

static struct thermal_cooling_device *
__thermal_cooling_device_register(struct device_node *np,
                  const char *type, void *devdata,
                  const struct thermal_cooling_device_ops *ops)
{
    struct thermal_cooling_device *cdev;

    cdev =3D thermal_cooling_device_alloc(ops);
    if (IS_ERR(cdev))
        return cdev;

    cdev->np =3D np;

    return thermal_cooling_device_add(cdev, type, devdata, ops);
}

where thermal_cooling_device_alloc() does all of the ops and other
checks and the cdev struct allocation, and
thermal_cooling_device_add() does everything else previously done by
__thermal_cooling_device_register() itself.

Then, it could be renamed to __thermal_of_cooling_device_register()
and the non-of variant would simply skip the np assignment (and it
would not take np as an argument).

You can deal with the devm_ variants of the above analogously.

