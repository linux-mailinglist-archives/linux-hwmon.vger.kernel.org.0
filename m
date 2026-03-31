Return-Path: <linux-hwmon+bounces-12963-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CwGOWAYzGnIPgYAu9opvQ
	(envelope-from <linux-hwmon+bounces-12963-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 31 Mar 2026 20:54:24 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F0370411
	for <lists+linux-hwmon@lfdr.de>; Tue, 31 Mar 2026 20:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78C11301051E
	for <lists+linux-hwmon@lfdr.de>; Tue, 31 Mar 2026 18:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C284138F236;
	Tue, 31 Mar 2026 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="IbR5Wtq2"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CBA2FD7D3
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983251; cv=none; b=GH7JZB7CYLIbimX6M/uDMdj56OVhPU3N4/kUpMY+xVG70uTOsNd5PLz8biOD2Flgu16fAAIpiqMOvQGVyq1sC8kVyuebgnG3T3pcWgTcAD7Ug8S/Aoxb4Rb3P9BHxSItISvAP2tZuYjzE53LgDxKOsn827kzNLTbcXUOjunq0IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983251; c=relaxed/simple;
	bh=h9kpbstgI+F9CmfaaRTOoc5awUYZsYssGMXCu9JoKtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqJx1OfRLFDoP5ddZ87omZUgtML2eDgZwAaqGRQddFwZo1WQLW1li47+T8+2xqyawbtzWS1Ejd3IiZw68vUXpM1KwZWggXvuSzllroJDTxvkr7OL1VB0/X408wFeyafS33obfvHOOsPYqyfPsZC7XcZoSdzKKbbhUN53V2gtoKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=IbR5Wtq2; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 05E5F401F4;
	Tue, 31 Mar 2026 11:54:10 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id E11DD40261;
	Tue, 31 Mar 2026 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=fV1umuNVZB9H
	FLiJlO+luBrBkMk=; b=IbR5Wtq23WKnuV6X1U5NlC/dcvD4g0c2Ru1fIUQIozNn
	fomMUDZAmjpqV51/F7yK3pcmYqkFp3GIyFSi5OOCemE2j8UsUimwm63EkulKDn92
	V2aBgQGlIrMxxyaihBoHDHwU/8fRJBw6LHiODrsHKY81G6jEkqWfLUy+se2fHTg=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=Rgq5SM
	Y3wE52G63GaUEdG2wPrhuUYRDKTq0+E6SmHGNRgJOt+6BcBepk3BZC9LCEaaZ7Um
	MDgXd+U+ECv9oBAjf4Bqd89YG2ZFetLUMFG46satKiNYrAAjc9Dx12Ar/TkNoI+w
	kjCUfBCdMVtQ6aPa0g/avfcrzxfwAik+FJ5Dc=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id A30D0401F4;
	Tue, 31 Mar 2026 11:54:09 -0700 (PDT)
Message-ID: <b125efec-b7db-4c4c-aaa7-e575bc4d42e3@fatooh.org>
Date: Tue, 31 Mar 2026 11:54:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
References: <20260331175245.354188-1-bugfood-ml@fatooh.org>
 <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
 <CAB95QARU_8Wu35S3pCQta3L=SM7Z=5ehYZbzxDrSzeuRb3o-FQ@mail.gmail.com>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <CAB95QARU_8Wu35S3pCQta3L=SM7Z=5ehYZbzxDrSzeuRb3o-FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fatooh.org:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12963-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[fatooh.org];
	FREEMAIL_TO(0.00)[gmail.com,roeck-us.net];
	DKIM_TRACE(0.00)[fatooh.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugfood-ml@fatooh.org,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: 4E0F0370411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-31 11:19, Eugene Shalygin wrote:
> On Tue, 31 Mar 2026 at 20:08, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> The above text is appropriate for comments after "---", but it is not
>> appropriate for a patch description. Please see "The canonical patch format"
>> in Documentation/process/submitting-patches.rst for information
>> on how to write a patch description.
> 
> And perhaps include the "Fixes:" line?

Sure, I can add a Fixes: line to reference commit f7ac3020036b in my 
next patch.

Thanks,
Corey

