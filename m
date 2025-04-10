Return-Path: <linux-hwmon+bounces-7738-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7CBA86489
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Apr 2025 19:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 228111881CA7
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Apr 2025 17:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7DB221FB3;
	Fri, 11 Apr 2025 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OxfMaOLn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707E21B905
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Apr 2025 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391107; cv=none; b=VB6wLPfo4YCd8L6floyDe+IFsthH3OzHxEbgYI72Cew0kNJDcP5UvYe33g5Sy46wo8rRBAhhGpzMqEQFrGVO5YLtVjPzons8bJ8c61A3hibnJ7LHNdH6EJYlTQl9nGeZFO+iP8avKaSiuoH6CUvGkPly17Y1odVr5BOouwBfEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391107; c=relaxed/simple;
	bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fuVYDpMcJQXnhGiB82v1JF5q5NK4f0ypC8usPyhmNVPBw6zWlWJstbk8lkHAOXL2aquUC8QYQ/mGjnF6wTrPzm8h6bv+efxCS/GJRr+WF5jSuDV+OcV/meqqF8sbNgu1B9pufhLoBHpvYfAchCjom2JmROtdLGLves8F3De3oGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OxfMaOLn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22622ddcc35so30521515ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Apr 2025 10:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744391105; x=1744995905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
        b=OxfMaOLnJQdyVHmKmfgMB7kY7TuYFVxzicfsCuVGmKUc0IH7VQnF6vOCOhGCn3cr4i
         twP83y65t0+rt4q+fiPg3Azt6k4EBIhzKr0dqqLg4AHRLL9zP2MovlEjHCAvez41PG2c
         hivN/2ykxTQObCqNZD5pvXlSfHlimyyfgNgNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391105; x=1744995905;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs24uJAaPNdL7CMzi1gfleFstPNRatFfxR2lJdWyGy0=;
        b=u5RbQwhb2i1FZX1lbo8y4FhZWRK/Rc8NUz7gxBNApqIpUOWt0uYvwJkWo0Zbokn2K9
         oWt6FARBGugefDXSmAt6dkTTmLmhJJjbcvwWopU2TVnrCslM4nkeh3zwzGuROJay8o42
         rS5drAJLb/xLeWSABek0lvFI0lH1/EZnz0a2jwhu1rVnwHt1fDk/gGT6UCG0OBuF/s55
         PWBgesv2dIe/k6X4QQmkAbtnHLbPC9bbzfN9K10F8LamVAPyQ7yPQ5kNLxVmgghn+6Bw
         zbwe8+aF8sy3Zp8xV3w/RkO6IDi3V+achHW4cZtUL6rJ5VM8HJoPpcWMFhE5/juYTnGj
         /e3g==
X-Forwarded-Encrypted: i=1; AJvYcCWTr5fm9Rz3hdSDVFePIR8HhLoLUkRDvOIGcXFSwphKTXnIeTkZudFHVPQYseOQ2CCY2k2Pk6sGi5t24g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlc2nYML2JP2bP25rZA7NYetK6/Sf6P4n39KqmB7h71CSBfP0u
	uFAy9LdwXl5EV26Z+hIz4oQteRY+s3hs/2f1RmxSuheXeXvs3bSVRtEC9d37Yw==
X-Gm-Gg: ASbGncvdPf5z5TfZCl7rabHcUwJ2DTEwAAt6iXK96mbH3aWfWan+ownfYU4ysa9dJHw
	MZXQIopLFxo4cUR84j/jZ2ctJyrmuDj9scidDAF4lOM9765F4CSRLMwGoAoRBz9UvPTTvHr3wPO
	wLKywcz1UE0/XsrA1zd94/ztEV9V4JxfF3ZEzyx8mLQhGBhFJdkr8Ng2Gvbsq6FynPo5G7Gqdt8
	RVhy/UbDbMbVJT5hhmDIyYbdov/Iq6PyaPwadcCOAh9D58oGwkzaA4QqsP9vofpRdGwK/euKUxw
	/GTwj1jG8zmGp9nsC+l+9Olk57qtv5vw10uJ3xIqk2nL8Lcju+EwbBfCi6xpGrWdLj9AJVVltEH
	EzPU=
X-Google-Smtp-Source: AGHT+IFsxw8IYiWvCcCfohL9OR/GeWdiXtYFPHAC7JyqV95Ksyc9aMccKi6WlaMRFkxD3Uw+BXU/BA==
X-Received: by 2002:a17:902:e5cf:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22bea4efe58mr64393975ad.40.1744391105389;
        Fri, 11 Apr 2025 10:05:05 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93aa3sm52081595ad.149.2025.04.11.10.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:05:04 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>
CC: Johannes Berg <johannes@sipsolutions.net>, <tglx@linutronix.de>, <mingo@redhat.com>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	<jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, 
	<andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, 
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, 
	<dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, 
	<hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
	<vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, 
	<davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, 
	<parthiban.veerasooran@microchip.com>, <gregkh@linuxfoundation.org>, 
	<jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>, 
	<jdelvare@suse.com>, <linux@roeck-us.net>, <alexandre.belloni@bootlin.com>, 
	<pgaj@cadence.com>, <hpa@zytor.com>, <alistair@popple.id.au>, 
	<linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, 
	<jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, 
	<dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, 
	<linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, 
	<oss-drivers@corigine.com>, <netdev@vger.kernel.org>, 
	<linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, 
	<brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, 
	<bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, 
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>, 
	<david.laight.linux@gmail.com>, <andrew.cooper3@citrix.com>, 
	Yu-Chun Lin <eleanor15x@gmail.com>
Date: Fri, 11 Apr 2025 19:04:43 +0200
Message-ID: <19625cf93f8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 11, 2025 6:37:35 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
>> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>>>
>>>> This is orthogonal to the change to parity_odd() though. More specific
>>>> to the new parity_odd() you can now do following as parity_odd()
>>>> argument is u64:
>>>>
>>>> err = !parity_odd(*(u16 *)p);
>>>
>>> Can it though? Need to be careful with alignment with that, I'd think.
>>
>> My bad. You are absolutely right.
> Then maybe we can still go with:
>
> err = !parity_odd(p[0] ^ p[1]);
>
> I believe this should still be a fairly safe approach?

Yes. Or whatever the name will be ;-)

Regards,
Arend



