"use client";

import Image from "next/image";
import Link from "next/link";
import { useEffect, useState } from "react";

import styles from "./FavoritePlayers.module.css";

const STORAGE_KEY = "aboutlol.favoriteRiotIds.v1";
const MAX_FAVORITES = 5;

type Favorite = { riotId: string; iconUrl: string | null; level: number | null };

function readFavorites(): Favorite[] {
  try {
    const stored: unknown = JSON.parse(localStorage.getItem(STORAGE_KEY) ?? "[]");
    if (!Array.isArray(stored)) return [];
    return stored.filter((item): item is Favorite =>
      typeof item === "object" && item !== null &&
      typeof item.riotId === "string" && item.riotId.length <= 80 &&
      (item.iconUrl === null || (typeof item.iconUrl === "string" && /^https:\/\/ddragon\.leagueoflegends\.com\/cdn\/[^/]+\/img\/profileicon\/\d+\.png$/.test(item.iconUrl))) &&
      (item.level === null || (typeof item.level === "number" && Number.isSafeInteger(item.level) && item.level >= 0))
    ).slice(0, MAX_FAVORITES);
  } catch {
    return [];
  }
}

export function FavoritePlayers({ current }: { current: Favorite | null }) {
  const [favorites, setFavorites] = useState<Favorite[]>([]);

  useEffect(() => {
    setFavorites(readFavorites());
  }, []);

  function save(next: Favorite[]) {
    setFavorites(next);
    try { localStorage.setItem(STORAGE_KEY, JSON.stringify(next)); } catch { /* 저장소를 쓸 수 없어도 검색은 계속된다. */ }
  }

  const alreadySaved = current && favorites.some((item) => item.riotId === current.riotId);

  return (
    <aside className={styles.aside} aria-labelledby="favorites-heading">
      <p className="mono">01 / MY PLAYERS</p>
      <h2 id="favorites-heading" className={styles.heading}>즐겨찾는<br />소환사</h2>
      <p className={styles.explain}>검색한 Riot ID를 저장하면 이 브라우저에서 바로 다시 열 수 있습니다.</p>

      {current && !alreadySaved && (
        <button
          type="button"
          className={styles.add}
          onClick={() => save([current, ...favorites].slice(0, MAX_FAVORITES))}
        >
          <span aria-hidden="true">☆</span> {current.riotId} 추가
        </button>
      )}

      {favorites.length === 0 ? (
        <p className={styles.empty}>아직 저장한 Riot ID가 없습니다. 전적을 검색한 뒤 즐겨찾기에 추가해 보세요.</p>
      ) : (
        <ul className={styles.list}>
          {favorites.map((item) => (
            <li key={item.riotId} className={styles.item}>
              <Link href={{ pathname: "/", query: { riotId: item.riotId } }} className={styles.player}>
                {item.iconUrl ? (
                  <Image src={item.iconUrl} alt="" width={52} height={52} className={styles.icon} />
                ) : <span className={styles.iconPlaceholder} aria-hidden="true">✦</span>}
                <span className={styles.identity}>
                  <strong>{item.riotId}</strong>
                  {item.level !== null && <small>LV. {item.level}</small>}
                </span>
              </Link>
              <button
                type="button"
                className={styles.remove}
                aria-label={`${item.riotId} 즐겨찾기 삭제`}
                onClick={() => save(favorites.filter((favorite) => favorite.riotId !== item.riotId))}
              >×</button>
            </li>
          ))}
        </ul>
      )}
      <p className={styles.limit}>최대 {MAX_FAVORITES}개 · 이 브라우저에 저장</p>
    </aside>
  );
}
