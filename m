Return-Path: <linux-hwmon+bounces-12229-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK69E0jQrGkHuwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-12229-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 08 Mar 2026 02:26:32 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D29C422E3A7
	for <lists+linux-hwmon@lfdr.de>; Sun, 08 Mar 2026 02:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0552430233EB
	for <lists+linux-hwmon@lfdr.de>; Sun,  8 Mar 2026 01:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197762522A7;
	Sun,  8 Mar 2026 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBpPf3Qg"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680B24887E
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933175; cv=none; b=QsS4Fuug/KVmpfwsGbaKfenDJUCUnTbFwXiKVB2OfDnOKgDmNGyHIYH+Ff9EsAzMKL443lSdag0XoGTL+Pu4lxYEErIL/weVUrp73KWlAPpshtZt9q/wOKzqb7OP/0JbdVSC7z52Npkq+KEAEbdipGBUDNjbPShj/zjMR5AKOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933175; c=relaxed/simple;
	bh=PV9HJmI0gwPJfiRJ9lcMDt9pFAHX7PAMs4DXco1V4aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXPGYE44/ClESTKoTW1WZzMnX1zXqSauScooPu6hfnxwO5rgRKg2SdqhOVJL1Epby0dY8oH9aBm7ujP7jTEfx6CShdUKvYJu/kbigqwnLX3UKyP9EuQen8VuQbrjTrZBDG0WWxT5FFHZmYdhk+J84jNHkUThXj7jBhjhhDDElw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBpPf3Qg; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128ce84f7acso170940c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 17:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772933163; x=1773537963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMGOEP8o1CIORARa23tSgEltpfieHIYSfo2TXshKwnk=;
        b=DBpPf3QguEZrYqh2DwngPsyEicThZuYz1F0sSDNq75gjooRrpFowVVrMNlg4LWLrwd
         x2jBpKATuaWD0UUa8P0mMwTSCmEk1QLHLhkyrMB2w6e/XFCauXpfGpbiiyDT7OBPzvCf
         b1SzLUY3SFzXh9qTwLC2pon8fgh28lZVd8UZ0QdAm2JjHkx5Wgy0ni1fqAzihHwyNz9f
         ghxJGgQ/d7Mc8JrCmXlTAaie20nko+3jBKAY7j2sOjHY4t7zFvHAGTvKtVO+c11SHpeG
         E0MOMajbtaJyucqbvlOw7MRlE1CpGbYhqecAq21x2u2PWje3yERxylTjUK99u/JVJlhU
         pHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772933163; x=1773537963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mMGOEP8o1CIORARa23tSgEltpfieHIYSfo2TXshKwnk=;
        b=aDakuwot7T2uBdi1VM3KV05Jo7S+gGpFwZazy2kFEuWNTBz2BLA0Rtam5jVW4OGXqw
         bQG1JrOxEPPSD14lPWL/Jec0TeRxWriJh9wMcFZGoArX4haX2rWzgXw7SdNjamhb/Obe
         qjGkAeIAj+IGaptwlj2jTeVxPFU//w0vODjNASDZRK7AtVD4XFVSFkfw1JQ0MjrPJa0X
         HfOqnF/rryh6lOVZecNfqU84OeCm8WawT/gqHnLAZkKhv3+CzvniUjFZyrHfcLK4cB2F
         7CiYJIXePzn5BAYQQkX8b0Mz6c1mHo44NSuvPNKyvABCNfVcbsipU6Ou58rXNuSqGZRO
         XfhA==
X-Gm-Message-State: AOJu0YxUpr2vNxIwxO0Tuw2IWaSyjnfAETTIpEsqmeR0AawNQEuW+S5K
	i1LD9ozR+AFvr6XJTS0BZCH9FB53pocBo/kuF85Y1dV1zd/9PTgFI6ZZ
X-Gm-Gg: ATEYQzw4HWfZ/Tt+KHDS/M48EyEFM3q43sUjxPoH02G/L7bMxvapWC6UCTHQjC+Cn9X
	YE+4OyzhzwHqew/9dTCWi4vkdnwAKtzT//loukcoj/G2F7qU5ew1+n3jTI2ZOhe4/kmF24FqsPy
	VDOuQHhgoWnn3NZiU+dpPWmmO41sGGnn9lekOanlEgxvNzjTOyQSHfBlDvWMqWKH8y2vYDBE9pd
	fQdTRCxwArVSyHqViUrrsYVn16yk6uYNTG9HcjV3rrvRxXmGi28Akd0PsAdXQgKwWbD12+sxsW1
	B6ek5mxAZcTg9tGht6VnzQ2Ep2XDOwmRI2cT4ekG2Md2ZHoR47M5EE1tC+hN4vTfFUf5NV+rjw8
	HyNHzXoqG9e8fQp49ynGfp7YIQqSFt9iLymvNtfEmsd7FgG6GM7iEpW5Fm4FLxoPqajPrUpqtpw
	Iq3lu33IrgMETUK5XhYu3lI+1MAC4a7nQ8ZUL39Z/8OJE9eeM=
X-Received: by 2002:a05:7022:688e:b0:122:345:a944 with SMTP id a92af1059eb24-128c2e526dcmr2616596c88.29.1772933162863;
        Sat, 07 Mar 2026 17:26:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d43b0fsm4100192c88.2.2026.03.07.17.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:26:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Mar 2026 17:26:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] hwmon: (pmbus/max31785) fix argument type for
 i2c_smbus_write_byte_data wrapper
Message-ID: <cb023ca5-9d03-4914-b32e-b7bbc7c9641f@roeck-us.net>
References: <20260307224517.38316-1-sanman.p211993@gmail.com>
 <20260307224517.38316-2-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307224517.38316-2-sanman.p211993@gmail.com>
X-Rspamd-Queue-Id: D29C422E3A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12229-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,juniper.net:email]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 02:45:19PM -0800, Sanman Pradhan wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The local wrapper max31785_i2c_write_byte_data() declares its data
> parameter as u16 but passes it directly to i2c_smbus_write_byte_data()
> which takes u8. Fix the type to match the underlying API.
> 
> No functional change; all current callers pass values that fit in u8.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter

